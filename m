Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE3D2D0BF0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E1989A5E;
	Mon,  7 Dec 2020 08:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B18189A5E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:45:54 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y16so14125463ljk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=jabt6z36o8UmqeFaOCtY57uA0InrrV3PXL5Iq00P0Hw=;
 b=TQK97MwrgEUD10/PaoLQCtwlYhvM7UhUh47OlFZoUUtBBj/efICda1NjUJOlIAcBXF
 btREnCpnnYSjB/drb5xU0cnBY/vG7acYam8rPu7eGlt1DvpZHkif3qH6ZF101O96hJl3
 2093dyYzzRY/MVCqV9R6OtDAnYawtfoq5pL3fbjxlWN9IQuSFmiYN4BeCtYDiNYpQSAH
 laMwUZWJc67/gT8AElGC/068UDbY953hIJ1VB0KQwqic4uvT1diKIg0bPpMWimt8uMIe
 +ttO1zQgyeTnOKcW8zUQRUI++TUs1/8mEfjvLYotA13Vmrw3aHKT3HsXLChz3mmv7nDx
 2zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=jabt6z36o8UmqeFaOCtY57uA0InrrV3PXL5Iq00P0Hw=;
 b=WprOXSSzwrN25cXrwfuWSDBUXtyemb5l2xF4gDWDrqxelYmV9J+zes40ZGeYdvqEa1
 9YN6jpGtGw0f7DmlBZ8BCPaLHK1urpP2dm2kQI6jtEUl+zt3A1ekmzOq3g6TewrEe0to
 9MeOeK3hrmOFu759ERL7n4ptw4PFzrkDh58egmexmHHO+bPZwD+bHQifR/lhEcM+nPSg
 YhY5KxtV2ZZihOQtauANi9mxCRZNVR4WQDDT9iJCR59hTXgFOZKtvkAaBnr5iLQIxQZa
 Pko7iwOdtaItii9skE6TOwF4XKDbvoH9nc0r8AkH5/bNChyp+yRqImakGSgmFqjIaj0V
 oYCg==
X-Gm-Message-State: AOAM5306krcA6zP3FX385OJVbvof/WuvwQvYMk/9xIn4xMaDlfiQvbb9
 rbA6krmuWwDw+qXwd375kEA=
X-Google-Smtp-Source: ABdhPJxMrdtfjqT3Z2DpvFKlqvNyoCUblI9i0pcUPilhYouNMt6UjHJBpr9dOvSf2GGszQM157ohjQ==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr8349900ljm.446.1607330753328; 
 Mon, 07 Dec 2020 00:45:53 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x69sm790549lfa.113.2020.12.07.00.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 00:45:53 -0800 (PST)
Date: Mon, 7 Dec 2020 10:45:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: drivers may provide multiple primary planes per CRTC
Message-ID: <20201207104542.10657acd@eldfell>
In-Reply-To: <1A6pssulTBjmoPioJfGenq9NdbnGjw2dhBoivqmrgraY67Gac7BoUHupkvqc7UBF_q2P5RwEcXP-m-5Jd00vC2hg-QMkGj2Ms_Jh5nLz-os=@emersion.fr>
References: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
 <20200807090706.GA2352366@phenom.ffwll.local>
 <20200807123802.6058baca@eldfell>
 <20200807130636.GD2352366@phenom.ffwll.local>
 <1A6pssulTBjmoPioJfGenq9NdbnGjw2dhBoivqmrgraY67Gac7BoUHupkvqc7UBF_q2P5RwEcXP-m-5Jd00vC2hg-QMkGj2Ms_Jh5nLz-os=@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1357242525=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1357242525==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AwT3xLyQ_/OQO=YxadgPWuk"; protocol="application/pgp-signature"

--Sig_/AwT3xLyQ_/OQO=YxadgPWuk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 06 Dec 2020 15:24:29 +0000
Simon Ser <contact@emersion.fr> wrote:

> Sorry, I think I lost track of this thread at some point and forgot
> about it. That said=E2=80=A6
>=20
> On Friday, August 7th, 2020 at 3:06 PM, Daniel Vetter <daniel@ffwll.ch> w=
rote:
>=20
> > On Fri, Aug 07, 2020 at 12:38:02PM +0300, Pekka Paalanen wrote: =20
> > > On Fri, 7 Aug 2020 11:07:06 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > =20
> > > > On Thu, Aug 06, 2020 at 10:33:31AM +0000, Simon Ser wrote: =20
> > > > > Some drivers may expose primary planes compatible with multiple C=
RTCs.
> > > > > Make this clear in the docs: the current wording may be misunders=
tood as
> > > > > "exactly one primary plane per CRTC".
> > > > >
> > > > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_plane.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_pl=
ane.c
> > > > > index b7b90b3a2e38..108a922e8c23 100644
> > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > @@ -49,8 +49,8 @@
> > > > >   * &struct drm_plane (possibly as part of a larger structure) an=
d registers it
> > > > >   * with a call to drm_universal_plane_init().
> > > > >   *
> > > > > - * Cursor and overlay planes are optional. All drivers should pr=
ovide one
> > > > > - * primary plane per CRTC to avoid surprising userspace too much=
. See enum
> > > > > + * Cursor and overlay planes are optional. All drivers should pr=
ovide at least
> > > > > + * one primary plane per CRTC to avoid surprising userspace too =
much. See enum =20
> > > >
> > > > I think that's even more confusing, since this reads like there cou=
ld be
> > > > multiple primary planes for a specific CRTC. That's not the case, t=
here'
> > > > only one pointer going from drm_crtc->primary to a drm_plane in the
> > > > kernel. =20
> > >
> > > There could be multiple primary planes *usable* for a specific CRTC b=
ut
> > > just one used at a time, right? =20
> >
> > I'm not sure what you mean here, the crtc->primary link is invariant ov=
er
> > the lifetime of a driver load. You can't pick a different one, that's s=
et
> > at driver init before drm_dev_register (and hence before userspace ever
> > sees anything). =20
>=20
> OK. I'm personally not very interested in documenting legacy bits, so I'l=
l skip
> that. I'm mainly interested here in making it clear possible_crtcs for a
> primary plane can have more than one bit set. Because of the paragraph in=
 the
> current docs, some user-space developers have understood "more than one b=
it set
> in possible_crtcs for a primary plane is a kernel bug".
>=20
> I'll send a v2 that makes it clear these pointers are for legacy uAPI.

Right, so this and what danvet said seem to be in direct conflict in
atomic uAPI, repeating above:

> > I'm not sure what you mean here, the crtc->primary link is invariant ov=
er
> > the lifetime of a driver load. You can't pick a different one, that's s=
et
> > at driver init before drm_dev_register (and hence before userspace ever
> > sees anything). =20

But still, it is considered not a kernel bug that a primary plane has
more than one bit set in its possible_crtcs.

If a primary plane has more than one bit set in possible_crtcs, and it
is not a kernel bug, then userspace expects to be able to choose any
of the multiple indicated possible CRTCs for this primary plane.

Which way is it?

Or, is there a different limitation that for each CRTC, there must be
exactly one primary plane with that CRTCs bit set in its possible_crtcs?

IOW, you can have more CRTCs than primary planes in total, and you can
activate each CRTC alone, but you cannot activate all CRTCs
simultaneously because there are not enough primary planes for them?

Representing it mathematically, the possible assignments according to
possible_crtcs while ignoring all other limitations are:
N CRTCs <-> M primary planes

- Is N one or greater than one?
- Is M one or greater than one?


Thanks,
pq

--Sig_/AwT3xLyQ_/OQO=YxadgPWuk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/N67YACgkQI1/ltBGq
qqdpXw/+Ng3Ub1lePo5gsxhRFYtQQhp/g5DqSLDhGP1WapNoEppjR7flUGVTgOo+
5utyasY3q4Dt79uSwtJqUMih5b0qVvHqjMviKqKd3we25YikDZNFzAI0wOZBOoVP
Esxq7vh5UpoXDV5dfNHSJU+BGh2MiNobrXsbFHtLvoZrAN4RfeY8C9gHYve9YtnY
5RiD64I1eqCHy2Fn9iUJHSqqBRTzivOpDSpNAGUazzkT1AOGqDq+oZ37q9ijU6th
w0y3ELfMdPIGhTtGwR8KEwGmR+dDQWUkM4R4op+dLxEjGoSluDILE6hWOi9Lli6q
no4/jHggoNE5hxXsMk/EpjnCwgnavFPWrw2ljMl9EZubU0nyE6CMwzKpEYKKxPoD
pf1OYev48uGeOMVV9S+MyI+6h5j/zr3BIKLOlPEbkc91PxsMXW+2+ODl+ykRmTul
lsroEuW+KAFWEz+ccOg5KUc6PHV1y0TVEmY+3bZeIbxqF2dQocYia+PqA09umDBI
M0tofpiMIwT0jT/m3/tkeRjw2maEpAbezT8Sv3XTYisLyRXBdzz+G0KKaAK+ZSUt
GPQpyZ7uINNgeHDcJNZnmqad3y+QGSk+VJK6ii7UgPboUQ9oSK5mWVxmkeXjmipd
ZP/s0a5kj3X0F7aRaGjOORbSxcZQh7LQL4WOQO2NZ3uz5LxhqXo=
=pNoT
-----END PGP SIGNATURE-----

--Sig_/AwT3xLyQ_/OQO=YxadgPWuk--

--===============1357242525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1357242525==--
