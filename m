Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BCC155BBE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 17:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304A06EAF8;
	Fri,  7 Feb 2020 16:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F296E0C8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 16:27:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s10so3180336wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 08:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=g5hFzqcKImqecJTfucQFuqf4KCnGTU9ws8qj9OluTHw=;
 b=jCl+nQIis/QO/xAhgCd91cyiWJm+Rsy/GOe2docaXXwCIPqsJj7I8HKGVzCjF+ceTD
 rBFvmpgtXBe1WUYe7IuUo/w6fPhGkNkD+WI51qLZ2pUahn0A01JXTGKxsIfFR7wGlcyC
 NsRwXzACaoI4haT9Dm1DqML15m24/mLlQhSK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g5hFzqcKImqecJTfucQFuqf4KCnGTU9ws8qj9OluTHw=;
 b=C6CeR++4wBoZxx6km/YyJ11YNfOHgnC7ARR9augHo87EMBKDak06n+L6ZCk4BVuYbX
 BBsCnhjtxXkrC5zf4owTA9vALQe/B8GXC33JVEwpZ+wTGSyzty+YCTKBp6HqqKTAzvUy
 rNLIGWsDNYlXLNTm0F/jx5bFZ/zM1DHmfkd2bWdDmY2ed5nbVXiuOMdWfZ7SV8vRDG7E
 7CL14JTF1Zfp3jxGoW/BVaIJmRGXYAl6Il68cfR5WoVFIVt1G+AgfovB7d+PeN8krmFb
 JpH/4cCGOnr9phYDLpVzOSRZfgy/5TYjbMGEvHpDokfAaG7gunWjNP/7S73NObqKXGze
 8WEg==
X-Gm-Message-State: APjAAAV4upW9sb48YNQapi1WgAzaDLHdntah4vz9ShUcl5myOBAzQpFt
 aVHsGGt+DqdVx5vK5JtcKxRuhA==
X-Google-Smtp-Source: APXvYqzghBRbvhuMCpPj1dod2Trka8PzcVPhn6RgQRZl3VB9dyQcghKIukoSbwvzTEcV6l44ac7WvQ==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr5457495wmi.152.1581092873321; 
 Fri, 07 Feb 2020 08:27:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b10sm4011105wrw.61.2020.02.07.08.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:27:52 -0800 (PST)
Date: Fri, 7 Feb 2020 17:27:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/6] drm: Include the encoder itself in
 possible_clones
Message-ID: <20200207162751.GJ43062@phenom.ffwll.local>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-2-ville.syrjala@linux.intel.com>
 <d58f13cf-6c9e-9a1c-5cbd-e51e1ad04e80@suse.de>
 <20200207145001.GI13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207145001.GI13686@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 04:50:01PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Feb 07, 2020 at 03:28:35PM +0100, Thomas Zimmermann wrote:
> > Hi
> > =

> > Am 07.02.20 um 14:59 schrieb Ville Syrjala:
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > =

> > > The docs say possible_clones should always include the encoder itself.
> > > Since most drivers don't want to deal with the complexities of cloning
> > > let's allow them to set possible_clones=3D0 and instead we'll fix that
> > > up in the core.
> > > =

> > > We can't put this special case into drm_encoder_init() because drivers
> > > will have to fill up possible_clones after adding all the relevant
> > > encoders. Otherwise they wouldn't know the proper encoder indexes to
> > > use. So we'll just do it just before registering the encoders.
> > > =

> > > TODO: Should we do something similar for possible_crtcs=3D=3D0?
> > > =

> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > May this fixup function should warn iff possible_clones was set to non-0
> > by the driver, but the encoder itself is missing.
> =

> Yeah, I guess we could do that.

+1 on that, should catch some bugs at least.

Also can you pls fix up the kerneldoc for drm_encoder.possible_clones,
defacto this now means that 0 is a totally fine setting.
-Daniel

> =

> > In any case
> > =

> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > > ---
> > >  drivers/gpu/drm/drm_encoder.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_enco=
der.c
> > > index e555281f43d4..f761d9306028 100644
> > > --- a/drivers/gpu/drm/drm_encoder.c
> > > +++ b/drivers/gpu/drm/drm_encoder.c
> > > @@ -66,11 +66,26 @@ static const struct drm_prop_enum_list drm_encode=
r_enum_list[] =3D {
> > >  	{ DRM_MODE_ENCODER_DPI, "DPI" },
> > >  };
> > >  =

> > > +/*
> > > + * For some reason we want the encoder itself included in
> > > + * possible_clones. Make life easy for drivers by allowing them
> > > + * to leave possible_clones unset if no cloning is possible.
> > > + */
> > > +static void fixup_possible_clones(struct drm_device *dev)
> > > +{
> > > +	struct drm_encoder *encoder;
> > > +
> > > +	drm_for_each_encoder(encoder, dev)
> > > +		encoder->possible_clones |=3D drm_encoder_mask(encoder);
> > > +}
> > > +
> > >  int drm_encoder_register_all(struct drm_device *dev)
> > >  {
> > >  	struct drm_encoder *encoder;
> > >  	int ret =3D 0;
> > >  =

> > > +	fixup_possible_clones(dev);
> > > +
> > >  	drm_for_each_encoder(encoder, dev) {
> > >  		if (encoder->funcs->late_register)
> > >  			ret =3D encoder->funcs->late_register(encoder);
> > > =

> > =

> > -- =

> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > (HRB 36809, AG N=FCrnberg)
> > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > =

> =

> =

> =

> =

> -- =

> Ville Syrj=E4l=E4
> Intel
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
