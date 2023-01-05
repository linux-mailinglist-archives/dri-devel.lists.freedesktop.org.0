Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A965F00C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8B510E112;
	Thu,  5 Jan 2023 15:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C207610E112
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:27:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gh17so90943292ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hLPiqEchGIeIjovjt6xTyLnsOkGYka/jBm9IJfRc8cQ=;
 b=Z3twHAAhZWjhFHjnPE3aHze2xhbvnbFatun2eXDXXppEQvdSmk2lwxKS4gnboLdAEF
 NcqDTTp9hBgaWKkA5ICUv6+vIADkejMh6T1lS0thqbnsCRGpNSXNN47UfOveNzETN3Uk
 UUfzeCP/eSt4ceDQBmKLlo4/wyR0WPlGLbgTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hLPiqEchGIeIjovjt6xTyLnsOkGYka/jBm9IJfRc8cQ=;
 b=mcP6SuJu/Skycq8H9+enUyvt+xQWHzp88i6UuOhWm3QEVpZ6AIkxvBy+bjFGQHHByV
 h37w4Qnon0kix38G/lVXOY/cys8atPXZUQZD0HQ5qEm3af+hMQsrARW1fw2qOjw0fg+1
 kR+sGczsjnxzV+ptNSh+urUDg/FdApR8dyUeAaJ4RI3McVEL/QecHYBY8/GvXpwt2HsS
 L7vYAmgXDv9XV9vBa9lsUGutQhESMEf6bqRxPr8jn2PUfPgm5ebVceelmzzOrHz4hsh0
 dC1Ut5QLB6gtDbdOinxEH8i/8wPffuE7qx7YzLS8g3lg69A0TConn+fzgbAGsAZCpS7W
 xlxQ==
X-Gm-Message-State: AFqh2kr4a8ZNXX7oVb8gF1zCOUUVDR8M8AHMsw97AMiIE9qawxxLrUlF
 2K9n0cROgI8Q4xvwZdYLUOs7vQ==
X-Google-Smtp-Source: AMrXdXtDCOQOGeQXvYmun8V2wk2xGyHkMO39/OjgjEDemVRB/FyhyFhtaEaSlrbEURiUzwLL/P6eQg==
X-Received: by 2002:a17:907:d38c:b0:7c0:b0f9:e360 with SMTP id
 vh12-20020a170907d38c00b007c0b0f9e360mr44953415ejc.16.1672932425288; 
 Thu, 05 Jan 2023 07:27:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b007c14ae38a80sm16398012ejc.122.2023.01.05.07.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:27:04 -0800 (PST)
Date: Thu, 5 Jan 2023 16:27:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/gem: Check for valid formats
Message-ID: <Y7bsRn1jSXiLqHaO@phenom.ffwll.local>
References: <20230103135916.897118-1-mcanal@igalia.com>
 <b39ac3a6-0866-01f5-dbea-2b86fbef9acc@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b39ac3a6-0866-01f5-dbea-2b86fbef9acc@suse.de>
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

On Tue, Jan 03, 2023 at 03:12:15PM +0100, Thomas Zimmermann wrote:
> 
> 
> Am 03.01.23 um 14:59 schrieb Maíra Canal:
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
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

See my previous replies, this is the wrong version :-)
-Daniel

> 
> > ---
> > 
> > v1 -> v2: https://lore.kernel.org/dri-devel/20230103125322.855089-1-mcanal@igalia.com/T/
> > - Check the modifier for each pixel plane in multi-plane formats (Thomas Zimmermann).
> > - Use drm_dbg_kms() instead of drm_dbg() (Thomas Zimmermann).
> > 
> > ---
> >   Documentation/gpu/todo.rst                   |  7 ++-----
> >   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 13 +++++++++++++
> >   2 files changed, 15 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 1f8a5ebe188e..68bdafa0284f 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -276,11 +276,8 @@ Various hold-ups:
> >   - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
> >     setup code can't be deleted.
> > 
> > -- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
> > -  atomic drivers we could check for valid formats by calling
> > -  drm_plane_check_pixel_format() against all planes, and pass if any plane
> > -  supports the format. For non-atomic that's not possible since like the format
> > -  list for the primary plane is fake and we'd therefor reject valid formats.
> > +- Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() checks for
> > +  valid formats for atomic drivers.
> > 
> >   - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
> >     version of the varios drm_gem_fb_create functions. Maybe called
> > diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > index e93533b86037..92d748f8553f 100644
> > --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/module.h>
> > 
> >   #include <drm/drm_damage_helper.h>
> > +#include <drm/drm_drv.h>
> >   #include <drm/drm_fourcc.h>
> >   #include <drm/drm_framebuffer.h>
> >   #include <drm/drm_gem.h>
> > @@ -164,6 +165,18 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
> > 		return -EINVAL;
> > 	}
> > 
> > +	if (drm_drv_uses_atomic_modeset(dev)) {
> > +		for (i = 0; i < info->num_planes; i++) {
> > +			if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> > +						      mode_cmd->modifier[i])) {
> > +				drm_dbg_kms(dev,
> > +					    "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> > +					    &mode_cmd->pixel_format, mode_cmd->modifier[i]);
> > +				return -EINVAL;
> > +			}
> > +		}
> > +	}
> > +
> > 	for (i = 0; i < info->num_planes; i++) {
> > 		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
> > 		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
> > --
> > 2.38.1
> > 
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
