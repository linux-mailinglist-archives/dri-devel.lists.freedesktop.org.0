Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F7E35EE9F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 09:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7936E45E;
	Wed, 14 Apr 2021 07:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68F76E45E;
 Wed, 14 Apr 2021 07:45:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a25so8961850ljm.11;
 Wed, 14 Apr 2021 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Oh3uXTI5AKPh0+QnB4MnRnmcHC/GiVg0BzjUws+n8xA=;
 b=D8ciI1VtZDibR38itw0RYrTuKKrtbe/DpuKI1d015E82jRU7Cjp8JAyv7zMj+Sjaxp
 b2jK7yt3Yfbl8zGEBFljZKdIJYfySnIwUeK4FyaicZqVt1pCpnICDIFgRoj7UxHuCi1k
 Tvl4UlMl3Vi/5BSHHvspe+tvdUDnb/59XL4RXrrlcNIWeiDFCkZXP/qsEsHnKIkxiLw0
 aoIcuJk20ouE8PJu+q0jTHCGFKp1XYIdXIwTkRDPWDxPQ8tlALiZl+MDQJeL5ySPgI53
 kThYa4BRXPrr/cPWg68eHty5uQKM5iei4/yusRVlZhlukJ3ieWCcjShtw0u1Of3CNAUi
 EWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Oh3uXTI5AKPh0+QnB4MnRnmcHC/GiVg0BzjUws+n8xA=;
 b=agyQFrfxecCnU3jHt+8KFQ/0Ymq24iNTuEsE7pdRLiBh6xnKhfhkxWQ8oKZ3/2d5/t
 7qz43WYKFyxd4O/gP8aBU9MmrKVKHHaFHjaC4QAoNldRPN6fk5vIC4KsnQDAlk9rXm9C
 vvMnk+oWr7/x1Y0bemEVzotRTDDIDZSfHmOixCUrtopQQXXQbJkXHNc6esrDDpk2yCyv
 YbY1AROfDz3XpLCOXGZpEtqtUJiu7NzQpI2ZRNJLNf9s5jJD71G/PB+1UOmkspQwfE9D
 zwSaeZzdDVJSRMcIRwdZr/QgKJhsNz/Oov+YEuMJpogILXqnEcYpyKOv9fXqknqb2gFa
 QXzg==
X-Gm-Message-State: AOAM532YJLzOQ3e2CwvPN/QkOwjqSoPxA3N1wHIswan7OhCN0832/NmK
 2jabb3Bty9DJbPdlARXWZrY=
X-Google-Smtp-Source: ABdhPJxNU9nkjIny1xQo1U7jvAL9/1B8t5814PNfaT4GHeNAY0CX6kKtdS56X/T4eggOIrHctEkjfA==
X-Received: by 2002:a2e:d19:: with SMTP id 25mr13522917ljn.369.1618386341179; 
 Wed, 14 Apr 2021 00:45:41 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f11sm4241479lfm.230.2021.04.14.00.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 00:45:40 -0700 (PDT)
Date: Wed, 14 Apr 2021 10:45:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 12/12] drm/modifiers: Enforce consistency between the
 cap an IN_FORMATS
Message-ID: <20210414104530.44b16355@eldfell>
In-Reply-To: <YHWmkZYqUeZKQN9R@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-12-daniel.vetter@ffwll.ch>
 <20210413145602.70f674b1@eldfell>
 <YHWmkZYqUeZKQN9R@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0191188620=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0191188620==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q+nGk+RET5w6PvXJF8OglyL"; protocol="application/pgp-signature"

--Sig_/q+nGk+RET5w6PvXJF8OglyL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Apr 2021 16:11:29 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Apr 13, 2021 at 02:56:02PM +0300, Pekka Paalanen wrote:
> > On Tue, 13 Apr 2021 11:49:03 +0200
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >  =20
> > > It's very confusing for userspace to have to deal with inconsistencies
> > > here, and some drivers screwed this up a bit. Most just ommitted the
> > > format list when they meant to say that only linear modifier is
> > > allowed, but some also meant that only implied modifiers are
> > > acceptable (because actually none of the planes registered supported
> > > modifiers).
> > >=20
> > > Now that this is all done consistently across all drivers, document
> > > the rules and enforce it in the drm core.
> > >=20
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
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index 0dd43882fe7c..16a7e3e57f7f 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -128,6 +128,11 @@
> > >   *     pairs supported by this plane. The blob is a struct
> > >   *     drm_format_modifier_blob. Without this property the plane doe=
sn't
> > >   *     support buffers with modifiers. Userspace cannot change this =
property.
> > > + *
> > > + *     Note that userspace can check the DRM_CAP_ADDFB2_MODIFIERS dr=
iver
> > > + *     capability for general modifier support. If this flag is set =
then every
> > > + *     plane will have the IN_FORMATS property, even when it only su=
pports
> > > + *     DRM_FORMAT_MOD_LINEAR. =20
> >=20
> > Ooh, that's even better. But isn't that changing the meaning of the
> > cap? Isn't the cap older than IN_FORMATS? =20
>=20
> Hm indeed. But also how exactly are you going to user modifiers without
> IN_FORMATS ... it's a bit hard.

Easy for at least one specific case, as Daniel Stone said in IRC. Use
GBM to allocate using the no-modifiers API but specify USE_LINEAR. That
basically gives you MOD_LINEAR buffer. Then you can try to make a DRM
FB for it using AddFB2-with-modifiers.

Does anyone do this, I have no idea.

Actually, I think this semantic change is fine. Old userspace did not
know that the cap means all planes have IN_FORMATS, so they can deal
with IN_FORMATS missing, but if it is never missing, no problem.

It could be a problem with new userspace and old kernel, but that's by
definition not a kernel bug, right? Just... inconvenient for userspace
as they can't make full use of the flag and need to keep the fallback
path for missing IN_FORMATS.

As long as there are KMS drivers that don't support modifiers, generic
userspace probably needs the fallback path anyway.

> I think this is all because we've enabled
> modifiers piece-by-piece and never across the entire thing (e.g. with
> compositor and protocols), so the missing pieces only became apparent
> later on.
>=20
> I'm not sure whether compositors really want to support this, I guess
> worst case we could disable the cap on these old kernels.
>=20
> > What about the opposite? Is it allowed to have even a single IN_FORMATS
> > if you don't have the cap? =20
>=20
> That direction is enforced since 5.1, because some drivers screwed it up
> and confusion in userspace ensued.
>=20
> Should I add a bug that on kernels older than 5.1 the situation is more
> murky and there's lots of bugs?

Yes, that would help to set expectations.

I'm currently on Debian stable FWIW, so 4.19 based kernel with I don't
know what patches.

On Tue, 13 Apr 2021 16:19:10 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Apr 13, 2021 at 04:11:29PM +0200, Daniel Vetter wrote:
> >=20
> > Should I add a bug that on kernels older than 5.1 the situation is more
> > murky and there's lots of bugs? =20
>=20
> I guess we should recommend to userspace that if they spot an
> inconsistency between IN_FORMATS across planes and the cap then maybe they
> want to disable modifier support because it might be all kinds of broken?

Yes please!


------

> >  =20
> > >   */
> > > =20
> > >  static unsigned int drm_num_planes(struct drm_device *dev)
> > > @@ -277,8 +282,14 @@ static int __drm_universal_plane_init(struct drm=
_device *dev,
> > >  			format_modifier_count++;
> > >  	}
> > > =20
> > > -	if (format_modifier_count)
> > > +	/* autoset the cap and check for consistency across all planes */
> > > +	if (format_modifier_count) {
> > > +		WARN_ON(!config->allow_fb_modifiers &&
> > > +			!list_empty(&config->plane_list)); =20
> >=20
> > What does this mean? =20
>=20
> If allow_fb_modifiers isn't set yet (we do that in the line below) and we
> are _not_ the first plane that gets added to the driver (that's done
> towards the end of the function) then that means there's already a plane
> registered without modifiers and hence IN_FORMAT. Which we then warn
> about.

Ah, ok! Would have taken a while for me to decipher that, and
impossible with just this patch context.

> >  =20
> > >  		config->allow_fb_modifiers =3D true;
> > > +	} else {
> > > +		WARN_ON(config->allow_fb_modifiers); =20
>=20
> This warning here checks the other case of an earlier plane with
> modifiers, but the one we're adding now doesn't have them.

Cool.


Thanks,
pq

--Sig_/q+nGk+RET5w6PvXJF8OglyL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmB2nZoACgkQI1/ltBGq
qqcFGQ//ZZqe6Vf64cEpyU19fKLi47KertYzn0aUALxH9Pui9SH2FsKlHqBpekDy
jvCn6gfoFoNBt/ZNn4q2jlQzHy/+macSFVc23QVUVj/A1pDza4LNEB73cjFkLQjW
Vg0rnO2lhEgd+pYmYryNrKP+i8Jg781zWJdD1XpifQzhwjhIBAcwVrzne0UL2ndT
XJa8GUuT5olXC/UNGeLojQIaMXt7YPVS/HXIcacEPaWDEV4UaSrQ9SVm49bHsJIt
3jOjFVd8lkS4WDSh/IJ+RBj1UJifW/kt+fIPywezkNW35l8sv69A6Lzd0c+A/h+o
9djvHRKuCceHqk5m7AGjXhcFprQJR/LIcQ0fHdVSLEfxiOlxAUgvDEIrGzzWAxr/
+Q5CgXRlkl5UTiX66haTL1VsswFkcZn7knhglS5NzlpC1Cck+sq7h9DaHCocchCt
cJg3Jonhd37FADNiWoCu+q2d4DpLXk6INKTTkSDWr/N0so1M1wXTlzYz33Lee6Pv
7pysmEJFYJ67GK+z1Wnrxjva8E0+C0hlPkYajCd/dUhv19JbuAjwdes+vyOPREiO
q0SLYJXsd73Dm57GNColGpkfzpmmlh7d9bfP1TEVJcbtzJSv3/ILT1Rl0MDroEbu
ZwUFEzG65cSyVoeBHR7E8n3mPVJ9rbhnSd3oJRuWfU3AsXihuF0=
=GLyu
-----END PGP SIGNATURE-----

--Sig_/q+nGk+RET5w6PvXJF8OglyL--

--===============0191188620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0191188620==--
