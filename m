Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15917151B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 11:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C956E330;
	Thu, 27 Feb 2020 10:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE946E330
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:37:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a141so2783671wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 02:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kXytEQflnTwi8/iDI64K/j4p42zd1eAQDuuQOYgdY80=;
 b=G9mCvgei8LVY1WNEtHWH/UAcg53RuIMIBi4sN/BbDnwgS1cbP7R4mic2eKiwaoLepc
 rHygRKxt7I0rvA21qQ+UhtTZpE2n5X1M7z1oYthPrj+XFP0tq3P9ZgoeAu8qTe+3tYng
 CVIN3PaG5cDrNPb/NGjgLc9nsmC2ohA6DxckM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kXytEQflnTwi8/iDI64K/j4p42zd1eAQDuuQOYgdY80=;
 b=Of2nrh6NqcZV3FA1ENo0nz2Hes2KrD6wNH+Ddg7jcGLDs+NClGzN5dfyPE+huQbfHw
 0OA0B5fIOoUwCx8lA5KMOsUPqi/fm6DVf9CH9nnhmuQ+oCcss+aZhVOsq2chlHpg+r4R
 e7OPkkqeObJ5mpg0UGIqv4QmQ6RSQh3XaLZW5ITGCZrBwN4v2cr7K7ot2hssQmyY7S6/
 0QKqT6FIAabriIFoZi1YcCvuH+BJuJ1avjSMQYbmwXW+vxZf8xnETaGMz5DIsP5opGJS
 X4KR28FtOaNRnogIi1uXLygoEv8qc6t/kOiVkU2/USFF/DYfUcdKhdpExDc85t+8gNDE
 dU0Q==
X-Gm-Message-State: APjAAAXEi6VAntJHIX5SrMChUcRwH0ZfMTQKZNm9DvbMrTV90lwykOiG
 kN51w288D2HwAM2raw+ek2YGlA==
X-Google-Smtp-Source: APXvYqxaWm7xXYtghZAMc1rnNMhj5beMBb/lxEoWQ5xUYytzdHWzHjZr3KmI182kdYkF3KFQpCRWtg==
X-Received: by 2002:a7b:cd94:: with SMTP id y20mr4384476wmj.26.1582799839118; 
 Thu, 27 Feb 2020 02:37:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r6sm7600128wrq.92.2020.02.27.02.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 02:37:18 -0800 (PST)
Date: Thu, 27 Feb 2020 11:37:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tidss: Add prepare_fb to the plane helper funcs
Message-ID: <20200227103716.GV2363188@phenom.ffwll.local>
References: <20200227101307.4385-1-jsarha@ti.com>
 <20200227103139.GU2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227103139.GU2363188@phenom.ffwll.local>
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 g-tammana@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 11:31:39AM +0100, Daniel Vetter wrote:
> On Thu, Feb 27, 2020 at 12:13:07PM +0200, Jyri Sarha wrote:
> > From: Gowtham Tammana <g-tammana@ti.com>
> > 
> > drm_gem_fb_prepare_fb() extracts fence and attaches to plane state.
> > The fence info is needed if implicit fencing is used. Add this as
> > prepare_fb function pointer to plane helper funcs.
> > 
> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> > Signed-off-by: Jyri Sarha <jsarha@ti.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I still wonder what we could do to catch these kind of bugs. There's
> really no good reason to ever not do this as the fallback ...
> 
> Maybe time to just make this the default prepare_fb hook if neither
> prepare_fb nore cleanup_fb are provided? Then roll out the removal for all
> the drivers that just set this one. Otherwise we'll keep playing
> whack-a-mole here forever ...
> 
> Ofc would need a bit of review and kerneldoc update, but I think that'd be
> the right approach.

Ok we'd need a notch more work here:

- Extract a version of drm_gem_fb_prepare_fb which doesn't keel over if
  the gem object isn't set in the fb struct. That will take care of all
  the drivers not yet converted to using these pointers, or which don't
  use gem (only applies for vmwgfx).

- Add that as the default in drm_simple_kms_plane_prepare_fb and clean up
  drivers using simple helpers too.

- Then long patch series to remove the default hook from all of them.

Just from a quick grep this would fix endless amounts of drivers ...
-Daniel

> -Daniel
> 
> > ---
> >  drivers/gpu/drm/tidss/tidss_plane.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> > index ff99b2dd4a17..345678faaeb6 100644
> > --- a/drivers/gpu/drm/tidss/tidss_plane.c
> > +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> > @@ -10,6 +10,7 @@
> >  #include <drm/drm_crtc_helper.h>
> >  #include <drm/drm_fourcc.h>
> >  #include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> >  
> >  #include "tidss_crtc.h"
> >  #include "tidss_dispc.h"
> > @@ -142,6 +143,7 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
> >  }
> >  
> >  static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
> > +	.prepare_fb = drm_gem_fb_prepare_fb,
> >  	.atomic_check = tidss_plane_atomic_check,
> >  	.atomic_update = tidss_plane_atomic_update,
> >  	.atomic_disable = tidss_plane_atomic_disable,
> > -- 
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
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
