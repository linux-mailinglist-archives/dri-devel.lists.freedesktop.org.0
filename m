Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5F2D3D97
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592836E15F;
	Wed,  9 Dec 2020 08:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808716E15F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 08:38:43 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o24so1292494ljj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 00:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=W1NsxesLTr/NP16oc9nynt9eszu760mpALJXJrA3f0o=;
 b=TqJkFNbZN3Nn2vGnERxBLMthSxxihV0fQkGme9WgVPznY15LDdfEUkLcG+oymAWQrW
 +HZtjkW7eoblrzMdR3/DJ+APtTEywK2hi5Ox0sjqpYR0hBbUnpVKu8payMHsWBJvHjoe
 MC20sZfT8a/LudeOS0r+9aDUo4GoYo3z0hXTddjAoBNQXYVRGFm+CTsfz85z7xBwZ9Td
 yXbkznQEcLgLPDkJU6L0/8tzEtPdI/xS29ZMTaKr0GUQqtpDWtGp0Kcss1lxsOGBN6Rj
 qi7Gr7AlRhOcMIf1cAQjh3l6PcOWugTkoWAWgEV4dE0JfvUzAN9wddM7NXbCDlZAF1f3
 zKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=W1NsxesLTr/NP16oc9nynt9eszu760mpALJXJrA3f0o=;
 b=nxdvstWGhDUbCnG9AwlyO5C/sQ0Ycwc4/ZRWcOc/h6w4IFkaL9IuzWwfU7c0aSZuM3
 dA+sHqHi6pCYB1Ox4mYq1PbdkN9XbKHr4d2mAk8hRZ7z6jExFXroSltIVD6oC/jQ1zYE
 tYNMVXBRS3syjchd/CZn95MGl81hCZJQZztGad3xMQhMXZTGxuWFyQWvJoifRM3X0HZM
 NnOjOcJ+uPiKbdBvH7QMRXX/koF7OrEoyfMMJ2Q+lGxsnf/GH2aJr9jDTY2mkI/ONtRB
 RxuERrrCztghiQ7gpRNYiun8R+XvFPHxpUDl3JtWbDK/8IL2IrAce4ijRKYBHQTn3Z7I
 n68g==
X-Gm-Message-State: AOAM533qRX9YFxyYY76Spfzy7PtLpypCaSi1+yBJAOnsaJcmFNxFHO22
 Kel0uu7Digl+jLkyiOfIO4I=
X-Google-Smtp-Source: ABdhPJw9zawAPJIz1+hMR+tNv8VRx+wKMX9BDxw3q9m9M7lt4pWe7RLFvzjVqucUWRHGf+4Lk+bvTA==
X-Received: by 2002:a2e:914c:: with SMTP id q12mr654197ljg.102.1607503121701; 
 Wed, 09 Dec 2020 00:38:41 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d19sm96252lfi.64.2020.12.09.00.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 00:38:41 -0800 (PST)
Date: Wed, 9 Dec 2020 10:38:36 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <20201209103836.1858c920@eldfell>
In-Reply-To: <20201209004223.GL401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============1361731888=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1361731888==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nSs90aY/duuOfZRJNL2RsB_"; protocol="application/pgp-signature"

--Sig_/nSs90aY/duuOfZRJNL2RsB_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Dec 2020 01:42:23 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Sun, Dec 06, 2020 at 04:34:15PM +0000, Simon Ser wrote:
> > The previous wording could be understood by user-space evelopers as "a
> > primary/cursor plane is only compatible with a single CRTC" [1].
> >=20
> > Reword the planes description to make it clear the DRM-internal
> > drm_crtc.primary and drm_crtc.cursor planes are for legacy uAPI.
> >=20
> > [1]: https://github.com/swaywm/wlroots/pull/2333#discussion_r456788057
> >=20
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_crtc.c  |  3 +++
> >  drivers/gpu/drm/drm_plane.c | 16 +++++++++-------
> >  2 files changed, 12 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > index 74090fc3aa55..c71b134d663a 100644
> > --- a/drivers/gpu/drm/drm_crtc.c
> > +++ b/drivers/gpu/drm/drm_crtc.c
> > @@ -256,6 +256,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_=
crtc *crtc)
> >   * planes). For really simple hardware which has only 1 plane look at
> >   * drm_simple_display_pipe_init() instead.
> >   *
> > + * The @primary and @cursor planes are only relevant for legacy uAPI, =
see
> > + * &drm_crtc.primary and &drm_crtc.cursor.
> > + *
> >   * Returns:
> >   * Zero on success, error code on failure.
> >   */
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index e6231947f987..7a5697bc9e04 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -49,14 +49,16 @@
> >   * &struct drm_plane (possibly as part of a larger structure) and regi=
sters it
> >   * with a call to drm_universal_plane_init().
> >   *
> > - * Cursor and overlay planes are optional. All drivers should provide =
one
> > - * primary plane per CRTC to avoid surprising userspace too much. See =
enum
> > - * drm_plane_type for a more in-depth discussion of these special uapi=
-relevant
> > - * plane types. Special planes are associated with their CRTC by calli=
ng
> > - * drm_crtc_init_with_planes().
> > - *
> >   * The type of a plane is exposed in the immutable "type" enumeration =
property,
> > - * which has one of the following values: "Overlay", "Primary", "Curso=
r".
> > + * which has one of the following values: "Overlay", "Primary", "Curso=
r" (see
> > + * enum drm_plane_type). A plane can be compatible with multiple CRTCs=
, see
> > + * &drm_plane.possible_crtcs.
> > + *
> > + * Legacy uAPI doesn't expose the primary and cursor planes directly. =
DRM core
> > + * relies on the driver to set the primary and optionally the cursor p=
lane used
> > + * for legacy IOCTLs. This is done by calling drm_crtc_init_with_plane=
s(). All
> > + * drivers should provide one primary plane per CRTC to avoid surprisi=
ng legacy

s/should/must/?

> > + * userspace too much.

I think it would also be useful for atomic userspace. Sure, atomic
userspace can be expected handle failures, but if there is not at least
one primary type KMS plane available for a CRTC, then userspace
probably never uses that CRTC which means the end user could be left
without an output they wanted.

Besides, in the other email thread Daniel said:

On Wed, 9 Dec 2020 01:36:37 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> possible_crtcs for a primary plane has exactly the same constraints as
> possible_crtcs for any other plane. The only additional constraint there
> is that:
> - first primary plane you iterate must have the first bit set in
>   possible_crtcs, and it is the primary plane for that crtc
> - 2nd primary plane has the 2nd bit set in possible_crtcs, and it is the
>   primary plane for that crtc
>=20

This implies the "must" I suggest above.

Note, that I have no context for this patch here, so I cannot know if
this is documenting a legacy-only KMS struct or legacy+atomic struct.
If the context here is legacy-only, then my comments above need to be
addressed somewhere else that has legacy+atomic context.

Likewise, I have no idea if any certain member or variable in the
kernel is legacy, atomic, or both.

> >   */ =20
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> I think maybe a follow up patch should document how userspace should
> figure out how to line up the primary planes with the right crtcs (if it
> wishes to know that information, it's not super useful aside from probably
> good choice for a fullscreen fallback plane). See my reply on the old
> thread.
>=20
> And that patch should also add the code to drm_mode_config_validate() to
> validate the possible_crtc masks for these. Something like
>=20
> 	num_primary =3D 0; num_cursor =3D 0;
>=20
> 	for_each_plane(plane) {
> 		if (plane->type =3D=3D primary) {
> 			WARN_ON(!(plane->possible_crtcs & BIT(num_primary)));
> 			num_primary++;
> 		}
>=20
> 		/* same for cursor */
> 	}
>=20
> 	WARN_ON(num_primary !=3D dev->mode_config.num_crtcs);
> }

A good idea.


Thanks,
pq

--Sig_/nSs90aY/duuOfZRJNL2RsB_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/QjQwACgkQI1/ltBGq
qqcsHA//Sx/akSXpQeKNvVRhvYjpNt3gr51LSuN5Wz0YAFEkqXAQq9g6cf8wgHqw
ScwNHdTPp6FUUBG/h6lxMyhFc8kGHZb0mrzq0e6Mj+HUHfBLULX/EDgnr+hdMUWB
2YkmVCpdIhKQOxy0eqeQ6L0m+o36HYp+ArUYWRrn4AdehzzC3uryad4hR7pYuIYQ
vH4t65HvgQoGbPImTspRKkF/4CVmP9m+x7SAqHQM89N7jd4xGwdHJvaDExJ4ofeG
o9/H5hYwdYWhtNjyHHdywVAPqySmPSkCxQyvdwyhlpaQ4sVimmQG0T5N+HwO+Aj3
nbbpcKioHQOLazyzLUE20VkLxRkP2fvn8gneyJ8Dd3td/DJ2uVvp3OSwarqFO3ig
vlVVwJXLGFA9M5bcV/eaPLDyHJL9FcjbCe4HtgKR6g6TDr5722Irq0RU2c1fyATN
cBGhj3Wu7CvinDHRBpxdUjDrA0R0IdiJYAhQrPm7xdL4kRba4RYpOrs8K9nIcsUV
kR8zETVlxjdVR9TI2cTcVoYo/Jds6mxEgkQ8105Bzm97KGwJ+ho7Xtmi8lpLN6F6
F9HG+RtUg/bUTtiH3jQABds1t/MnloNZ7Ymz66tU2qkkDyY3da+lY0yCT9rBsBRJ
qeuHTcOGptXLDFUW+mPKN/OSFa08lG4p7Lwr3h3j42GjOy6zjZg=
=1WsJ
-----END PGP SIGNATURE-----

--Sig_/nSs90aY/duuOfZRJNL2RsB_--

--===============1361731888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1361731888==--
