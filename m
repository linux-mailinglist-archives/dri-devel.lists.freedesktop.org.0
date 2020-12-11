Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1612D7ADA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 17:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3F46E43D;
	Fri, 11 Dec 2020 16:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408C36E43D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:25:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q18so2102581wrn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Q1wpUv1vUjI3mlAei/XAo34SUq/9zS14CPhgUoq6S0g=;
 b=TljUfRPx/J58ALys61Q2YRh++5/TuVM5hICO5lUXKUWEpZ6+bKakCDTPJjwagMmhdh
 EEi6CXow3vtSAQmk0SoWDy/nL0WCcpz3847/jdwdKjF4jKSeN8jvgHvYhjhw/7fhHmXd
 Wiw1/o+mq8jwLZgxMqc2KN/TqHv73yfRwnewI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Q1wpUv1vUjI3mlAei/XAo34SUq/9zS14CPhgUoq6S0g=;
 b=NxWEg2NYoKzJDT3PWLWyVfJ2qKJdgdu8Tmgm3ThgQEHjEF1S7WBymbHhgIjZIgiUyn
 2t4WkAH9EUt3FuRvorv8PqJnrn7qL2RuNcDwR0FSCp1cv5GzCKmwJjoYHC6+LGl5u29R
 q2q+ldGQxmIxel62F0WPaszyoliFHb8PZaSzhdDUuTa+YHkozYdmnLXDWXu0Y1p8swj1
 8bI/if1KlY03J1UnOy9nbJRqqj8cuCi/e67zUyMsUVxOCvlCIVYPNaddSPdtrXhHZtjC
 XJDNeJ2AJJtRkMgF7aKhW6KWMUGNAF2V6+JcR30/vz0z7x3nMNS9uE2U+FbUMhHow81Z
 oLGQ==
X-Gm-Message-State: AOAM531VjHHjoRjLzIBsiGFCsYXPoEyaz8kvA6TMxFsVzC+5OJTmQQwv
 jpBHDUPps6AJ0be5FpUX2PKXLQ==
X-Google-Smtp-Source: ABdhPJwm/ugefCHA8298Zdwkn/aYHI7Z2w0nvyYy9FhIHlgV44HkR73ZNyKamWE/7qGVP0j7u1McZw==
X-Received: by 2002:adf:ea43:: with SMTP id j3mr14893322wrn.393.1607703939975; 
 Fri, 11 Dec 2020 08:25:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p9sm10040837wmm.17.2020.12.11.08.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:25:39 -0800 (PST)
Date: Fri, 11 Dec 2020 17:25:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/vkms: Unset preferred_depth
Message-ID: <20201211162537.GU401619@phenom.ffwll.local>
References: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
 <X9OclB/6fOlel6W/@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9OclB/6fOlel6W/@intel.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 06:21:40PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Dec 11, 2020 at 05:11:12PM +0100, Daniel Vetter wrote:
> > There's a confusion between the preferred_depth uapi and the generic
> > fbdev helpers. Former wants depth, latter wants bpp, and for XRGB8888
> > they don't match. Which hit me with vkms, which wants that.
> > =

> > All other drivers setting this and using the generic fbdev helpers use
> > 16, where both numbers match, for RGB565.
> > =

> > Since fixing this is a bit involved (I think for atomic drivers we
> > should just compute this all internally from the format list of the
> > first primary plane) paper over the issue in vkms by using defaults
> > everywhere. Then userspace will pick XRGB8888, and fbdev helpers will
> > do the same, and we have what we want.
> =

> I think I had a patch ages ago that tried to improve the fb_helper
> pixel format stuff a bit. This one I think:
> https://patchwork.freedesktop.org/patch/203189/
> =

> Haven't checked how much of that would still be relevant though.

Uh this looks useful, my attempts have only tried to clean up the driver
side in what they're setting for preferred_depth and how they set up the
fbdev emulation. I haven't looked at the fbdev code itself, and especially
your mapping table should be useful.

Care to resubmit that one again?
-Daniel

> =

> > =

> > Reported-by: Simon Ser <contact@emersion.fr>
> > Reviewed-by: Simon Ser <contact@emersion.fr>
> > Cc: Simon Ser <contact@emersion.fr>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index d4d39227f2ed..aef29393b811 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -113,7 +113,10 @@ static int vkms_modeset_init(struct vkms_device *v=
kmsdev)
> >  	dev->mode_config.max_height =3D YRES_MAX;
> >  	dev->mode_config.cursor_width =3D 512;
> >  	dev->mode_config.cursor_height =3D 512;
> > -	dev->mode_config.preferred_depth =3D 32;
> > +	/* FIXME: There's a confusion between bpp and depth between this and
> > +	 * fbdev helpers. We have to go with 0, meaning "pick the default",
> > +	 * which ix XRGB8888 in all cases. */
> > +	dev->mode_config.preferred_depth =3D 0;
> >  	dev->mode_config.helper_private =3D &vkms_mode_config_helpers;
> >  =

> >  	return vkms_output_init(vkmsdev, 0);
> > -- =

> > 2.29.2
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Ville Syrj=E4l=E4
> Intel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
