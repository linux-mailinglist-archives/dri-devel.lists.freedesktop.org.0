Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEECC44AB00
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DD86E833;
	Tue,  9 Nov 2021 09:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723D86E833
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:55:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso1815629wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CoA/tgVndfBxBfjYr0LtoDiVbTfxosijEwYIOJghD7U=;
 b=jQj/9H2cCQLVtXcd/wDGYVOH8zRgcRDQD0z5NwUotustkPjFUuTa+fmThMI+Jl3NJ9
 A6jdadkslKU3lxjGkDL0jM74fDtHPphHT+r1kuF62l55dH0QhhzyWcE+4ZTCZwrBhwey
 JuCKmH0PWrYq/lD6k1jUYATbH2/5qkdBK7RYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CoA/tgVndfBxBfjYr0LtoDiVbTfxosijEwYIOJghD7U=;
 b=g/7+XX8d9fUpfXvuuknJFJsWfreygjkAm/6Q4uWT5ShRzVQI12STz2QgRBW6Vkn8/l
 MNehKHFm8pVfB/5YPFUQx+EUMebDXWzxre7s4RMVizatTEKGR3Ek517G/Vb7afqoEz9l
 eWC/43bbaEvOXoo70TSXlaqehhMOcpZdwDQtcHo62OlYE4nyWLmaVvVNGSDwFNzGy1n0
 Uz4/r1N4RHht2ZKmMWkZzJGR4CtZD4AfWlEwT4FQbKgHAPkI4yWfcAPcDCYyoPZ8neFD
 LPTTPH4k8QwWkLUbOdD5NoK7inGUKRWxoB6QdWjYcGimIWQkbZWhK4f8/Yk2bGhXmj4f
 tgEA==
X-Gm-Message-State: AOAM530+AFZ2S8EGDWsFzDXsvJxypGpWSQxAFBLk3MnFBSfh74xVmSIO
 h5OEetOI0LIgNqPy85ISQ4WHqQ==
X-Google-Smtp-Source: ABdhPJy29MBbVQOsAC2d3GcimJsO58J4nU0YvtabgKc/mlRmQQkidy1xf6BqWCDoe/gts7lFYFMOPw==
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr5850162wms.44.1636451703962; 
 Tue, 09 Nov 2021 01:55:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm2036108wml.9.2021.11.09.01.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:55:03 -0800 (PST)
Date: Tue, 9 Nov 2021 10:55:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <YYpFdQLCnwb+2dCa@phenom.ffwll.local>
References: <20211109085601.170275-1-contact@emersion.fr>
 <YYo+UeTjGWU11+u6@phenom.ffwll.local>
 <dGeG3QxOQ1QX1zh8rppvlkgIaYW-tP1fPJ_08FlKMZyl1l52qjBm7Aisp898z4wW-PmPfQ66gXNUTsfBG7sBvfF_QC13yaHXRdyxySfQDKg=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dGeG3QxOQ1QX1zh8rppvlkgIaYW-tP1fPJ_08FlKMZyl1l52qjBm7Aisp898z4wW-PmPfQ66gXNUTsfBG7sBvfF_QC13yaHXRdyxySfQDKg=@emersion.fr>
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

On Tue, Nov 09, 2021 at 09:29:54AM +0000, Simon Ser wrote:
> On Tuesday, November 9th, 2021 at 10:24, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, Nov 09, 2021 at 08:56:10AM +0000, Simon Ser wrote:
> > > There are a few details specific to the GETFB2 IOCTL.
> > >
> > > It's not immediately clear how user-space should check for the
> > > number of planes. Suggest using the pitches field.
> > >
> > > The modifier array is filled with zeroes, ie. DRM_FORMAT_MOD_LINEAR.
> > > So explicitly tell user-space to not look at it unless the flag is
> > > set.
> > >
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > ---
> > >  include/uapi/drm/drm.h | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index 3b810b53ba8b..9809078b0f51 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -1096,6 +1096,22 @@ extern "C" {
> > >  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
> > >  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
> > >
> > > +/**
> > > + * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
> > > + *
> > > + * This queries metadata about a framebuffer. User-space fills
> > > + * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the rest of the
> > > + * struct as the output.
> > > + *
> > > + * If the client is not DRM master and doesn't have &CAP_SYS_ADMIN,
> > > + * &drm_mode_fb_cmd2.handles will be zeroed. Planes are valid until one has a
> > > + * zero &drm_mode_fb_cmd2.pitches -- this can be used to compute the number of
> > > + * planes.
> >
> > Maybe explain that when actually importing the buffer userspace should
> > look for non-zeor handles instead, since some drivers/formats leave a
> > silly pitch value behind. Or at least I think that can happen. Just for
> > additional robustness?
> 
> The IOCTL zeroes out the arrays at the start, so should be fine.
> 
> handles will all be zero if user-space is unprivileged, so can't use them to
> figure out the number of planes.

Yeah maybe just mention that unused/undefined fields are zeroed or
something like that.

> > > + *
> > > + * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will be set
> > > + * in &drm_mode_fb_cmd2.flags. Otherwise, &drm_mode_fb_cmd2.modifier has
> > > + * undefined contents.
> >
> > Uh is this true? We should always clear values to avoid accidental leaks
> > and stuff.
> 
> See the commit message: the modifier array is zeroed, which means it's filled
> with DRM_FORMAT_MOD_LINEAR instead of DRM_FORMAT_MOD_INVALID -- this as good as
> undefined contents for me.
> 
> Since this is a pretty good footgun, maybe we should change this? But the docs
> would still need to tell userspace to not look at the array because older
> kernels will still exist.

Hm I think that's maybe better to document in the struct, since the entire
"no modifier means implied modifier with driver-specific rules" thing
applies to both addfb and getfb. Maybe we should also merge Daniel's "how
to modifier" so that we could link at in-depth discussion of these topics
in all the places where that's needed.

> 
> > > + */
> >
> > I think kerneldoc for drm_mode_fb_cmd2 would be neat too, so we can
> > document how pitch is supposed to work and all that stuff.
> 
> Agreed, maybe will take a stab at this once this one is merged.

With a line about "undefined/unused stuff is cleared to zero" added this
is:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
