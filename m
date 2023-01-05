Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748665F006
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7FD10E09A;
	Thu,  5 Jan 2023 15:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8089110E09A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:24:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id i15so53327785edf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MXndzEi0vpn5t0C/KU2fOU9xUZZdLXJQ0kZZY8+ewYs=;
 b=hWq65rbaH/pnVTIcqoekVHGcl5nBN8GSXjlFtMGguBFta5NtwyQeamFbN8nZMARVBc
 v2zrD6eGjPWGbV0QogdQTSLrOYFQ+Cb7b8LQ83oOIZhdhyD1ksk71evDN1BCqqKgLBPk
 R1ja4TocOOftOCiz4wVDQOUBc7LhT0Pyao/hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MXndzEi0vpn5t0C/KU2fOU9xUZZdLXJQ0kZZY8+ewYs=;
 b=3SCOOKoUHl/6Bsly+f4yDbDA65HH1btDVEgBM7OwBe1mry5NG6QcA+dpQ1vRHEXIpP
 DNz4cH/Pp/6JVcJVDyo4NFgpe70y4AWEhLHItPdoLt+wNHGlStKOdanCRCnSoa5LCEOg
 /+LHs7+fZxn0nmF7ro+PI0fQDPuSF9v9PYCUkjNCsbyJOCV6QCUoKxCt4J9YJJseptYa
 vO9NS5Cb+HCC+D/I1QAZWAtfs57RoOjtIgI+k5XX/QJ0Bz4SifWO73yIhOxmhQ2KDH74
 UxNJkkKu674os9UL18/GHxfoR447pADCHLLv93h5H84RXelZYxatNkdUsE7THz4E7px+
 BL4g==
X-Gm-Message-State: AFqh2kqmFTxrjuQzmciY4fQ3Q8qJi/SEF+i5cZZHHeDK2kKthUyjVBDB
 hl05rZz+586QteNiWuhiHdnLwg==
X-Google-Smtp-Source: AMrXdXvl5XAtSbeE7I7STadEJQBIqFqmKRN+88wwEPZjskKWXzSJWB3kDmQize5KIneGlI8r+xkCag==
X-Received: by 2002:a05:6402:1caa:b0:475:b14a:f83a with SMTP id
 cz10-20020a0564021caa00b00475b14af83amr41042306edb.15.1672932287956; 
 Thu, 05 Jan 2023 07:24:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a05640200c500b00463c5c32c6esm16022100edu.89.2023.01.05.07.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:24:46 -0800 (PST)
Date: Thu, 5 Jan 2023 16:24:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <Y7brvC7lvhtQCeU/@phenom.ffwll.local>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <de3c30a2-d9c6-cf5c-d4bc-e90bd3993f6b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de3c30a2-d9c6-cf5c-d4bc-e90bd3993f6b@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 03, 2023 at 02:16:30PM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for the follow-up patch.
> 
> Am 03.01.23 um 13:53 schrieb Maíra Canal:
> > Currently, drm_gem_fb_create() doesn't check if the pixel format is
> > supported, which can lead to the acceptance of invalid pixel formats
> > e.g. the acceptance of invalid modifiers. Therefore, add a check for
> > valid formats on drm_gem_fb_create().
> > 
> > Moreover, note that this check is only valid for atomic drivers,
> > because, for non-atomic drivers, checking drm_any_plane_has_format() is
> > not possible since the format list for the primary plane is fake, and
> > we'd therefor reject valid formats.
> > 
> > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > ---
> >   Documentation/gpu/todo.rst                   | 7 ++-----
> >   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 9 +++++++++
> >   2 files changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 1f8a5ebe188e..68bdafa0284f 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -276,11 +276,8 @@ Various hold-ups:
> >   - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
> >     setup code can't be deleted.
> > -- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
> > -  atomic drivers we could check for valid formats by calling
> > -  drm_plane_check_pixel_format() against all planes, and pass if any plane
> > -  supports the format. For non-atomic that's not possible since like the format
> > -  list for the primary plane is fake and we'd therefor reject valid formats.
> > +- Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() checks for
> > +  valid formats for atomic drivers.
> >   - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
> >     version of the varios drm_gem_fb_create functions. Maybe called
> > diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > index e93533b86037..b8a615a138cd 100644
> > --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/module.h>
> >   #include <drm/drm_damage_helper.h>
> > +#include <drm/drm_drv.h>
> >   #include <drm/drm_fourcc.h>
> >   #include <drm/drm_framebuffer.h>
> >   #include <drm/drm_gem.h>
> > @@ -164,6 +165,14 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
> >   		return -EINVAL;
> >   	}
> > +	if (drm_drv_uses_atomic_modeset(dev) &&
> > +	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> > +				      mode_cmd->modifier[0])) {
> 
> Because this is a generic helper, it has to handle the odd cases as well.
> Here we cannot assume modifier[0], because there's a modifier for each pixel
> plane in multi-plane formats. (That's a different type of plane than the
> struct plane we're passing in.) If one combination isn't supported, the
> helper should fail.

This was a mistake in the addfb2 design, we later rectified that all
modifiers must match. This is because the modifier itsel can change the
number of planes (for aux compression planes and stuff like that).

The full drm format description is the (drm_fourcc, drm_format_modifier)
pair.

This should be documented somewhere already, if not, good idea to update
addfb docs (or make them happen in the first place).
-Daniel

> 
> We get the number of pixel planes from the format info. So the correct
> implementation is something like that
> 
> if (drm_drv_uses_atomic_modeset())) {
> 	for (i = 0; i < info->num_planes; ++i) {
>         	if (!drm_any_plane_has_format(dev, pixel_format, \
> 				modifier[i]) {
> 			drm_dbg_kms(dev, "error msg");
> 			return -EINVAL;
> 		}
>         }
> }
> 
> 
> > +		drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> 
> drm_dbg() is for drivers. Use drm_dbg_kms() please.
> 
> Best regards
> Thomas
> 
> 
> > +			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
> > +		return -EINVAL;
> > +	}
> > +
> >   	for (i = 0; i < info->num_planes; i++) {
> >   		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
> >   		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
