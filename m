Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356B8A822F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D92211340E;
	Wed, 17 Apr 2024 11:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="zQAC1B3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC4811340F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713353684;
 bh=XlIkHEl9YP8QzzT01r9cxyH8iKbEFGbZFUWmqtKOhGU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zQAC1B3SB0udRMknK1EEu3nqJ0MlSW42n3B/J+YlyHsWELOrplw6ioLOjjBFFZUSL
 JwwKcJDpAd0fyqTv+NNl8itmEAwlzDrx/h0k7xGcBQU6sov3LI23nlNJzSbSBptn9p
 1j6t+uiv2hy8szo5qxiFI8R2K/cmTldSXwka71OSLjz/VN73jZHkrEA5ahtJHOmZYG
 B2X+c0gLvuo5FzM6njj5ywxRfGe3KLexDamnmcAreDa2YAENtg1jFDsjPbkImWrLDS
 F7+sg4TQkU6NH/6p3qxcdPlTH7obgTMMkOw2X8gW+VimDIbrGK0cVUU6ACH4HiYyH5
 uALccWT81BL5w==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E2AB5378208C;
 Wed, 17 Apr 2024 11:34:43 +0000 (UTC)
Date: Wed, 17 Apr 2024 14:34:35 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/3] drm: drm_blend.c: Improve
 drm_plane_create_rotation_property kernel doc
Message-ID: <20240417143435.6e1e414a.pekka.paalanen@collabora.com>
In-Reply-To: <Zh78IolP2rwpk1Ti@localhost.localdomain>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
 <20240415143622.7e600508.pekka.paalanen@collabora.com>
 <Zh78IolP2rwpk1Ti@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/Qm647ZkFj/Jf89mUkhkF3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/3/Qm647ZkFj/Jf89mUkhkF3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Apr 2024 00:30:58 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 15/04/24 - 14:36, Pekka Paalanen a =C3=A9crit :
> > On Tue, 09 Apr 2024 12:04:06 +0200
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > The expected behavior of the rotation property was not very clear. Add
> > > more examples to explain what is the expected result.
> > >=20
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/drm_blend.c | 52 +++++++++++++++++++++++++++++++++--=
----------
> > >  1 file changed, 38 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > > index 8d4b317eb9d7..6fbb8730d8b0 100644
> > > --- a/drivers/gpu/drm/drm_blend.c
> > > +++ b/drivers/gpu/drm/drm_blend.c
> > > @@ -104,6 +104,9 @@
> > >   *	Without this property the rectangle is only scaled, but not rotat=
ed or
> > >   *	reflected.
> > >   *
> > > + *	See drm_plane_create_rotation_property() for details about the ex=
pected rotation and
> > > + *	reflection behavior. =20
> >=20
> > I think internal function docs should be referring to UAPI docs, and
> > not vice versa. Internal functions can change, but UAPI cannot.
> >  =20
> > > + *
> > >   *	Possbile values:
> > >   *
> > >   *	"rotate-<degrees>":
> > > @@ -114,18 +117,6 @@
> > >   *		Signals that the contents of a drm plane is reflected along the
> > >   *		<axis> axis, in the same way as mirroring.
> > >   *
> > > - *	reflect-x::
> > > - *
> > > - *			|o |    | o|
> > > - *			|  | -> |  |
> > > - *			| v|    |v |
> > > - *
> > > - *	reflect-y::
> > > - *
> > > - *			|o |    | ^|
> > > - *			|  | -> |  |
> > > - *			| v|    |o |
> > > - *
> > >   * zpos:
> > >   *	Z position is set up with drm_plane_create_zpos_immutable_propert=
y() and
> > >   *	drm_plane_create_zpos_property(). It controls the visibility of o=
verlapping
> > > @@ -266,8 +257,41 @@ EXPORT_SYMBOL(drm_plane_create_alpha_property);
> > >   *
> > >   * Rotation is the specified amount in degrees in counter clockwise =
direction,
> > >   * the X and Y axis are within the source rectangle, i.e.  the X/Y a=
xis before
> > > - * rotation. After reflection, the rotation is applied to the image =
sampled from
> > > - * the source rectangle, before scaling it to fit the destination re=
ctangle.
> > > + * rotation.
> > > + *
> > > + * Here are some examples of rotation and reflections:
> > > + *
> > > + * |o  +|  REFLECT_X  |+  o|
> > > + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> > > + * |    |             |    |
> > > + *
> > > + * |o   |  REFLECT_Y  |+   |
> > > + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> > > + * |+   |             |o   |
> > > + *
> > > + * |o  +|  ROTATE_90  |+   |
> > > + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> > > + * |    |             |o   |
> > > + *
> > > + * |o   |  ROTATE_180 |   +|
> > > + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> > > + * |+   |             |   o|
> > > + *
> > > + * |o   |  ROTATE_270 |+  o|
> > > + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |
> > > + * |+   |             |    |
> > > + *
> > > + * Rotation and reflection can be combined to handle more situations=
. In this condition, the
> > > + * reflection is applied first and the rotation in second. =20
> >=20
> > When going in which direction? Is the first image the FB source
> > rectangle contents, and the second image what the plane looks like in
> > CRTC frame of reference? =20
>=20
> The first is the FB source, the second is the expected result on the CRTC=
=20
> output.
>=20
> I will add a sentence before the schemas:
>=20
>  * Here are some examples of rotation and reflections, on the left it is=
=20
>  * the content of the source frame buffer, on the right is the expected=20
>  * result on the CRTC output.
>=20
> >  =20
> > > + *
> > > + * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE=
_REFLECT_X is:
> > > + *
> > > + * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
> > > + * |    |  =3D=3D=3D=3D=3D=3D=3D=3D>  |    |  =3D=3D=3D=3D=3D=3D=3D=
=3D>  |    |
> > > + * |    |             |    |             |+   |
> > > + *
> > > + * It is not possible to pass multiple rotation at the same time. (i=
.e ROTATE_90 | ROTATE_180 is
> > > + * not the same as ROTATE_270 and is not accepted).
> > >   */
> > >  int drm_plane_create_rotation_property(struct drm_plane *plane,
> > >  				       unsigned int rotation,
> > >  =20
> >=20
> > These are definitely improvements. I think they should just be in the
> > UAPI section rather than implementation details. =20
>=20
> So, somewhere in [1]? It feel strange because this is in the `GPU Driver=
=20
> Developer=E2=80=99s Guide` section, not a `UAPI interfaces`.

The whole kernel documentation layout is a big mess. I *still*
spend ages trying to find the pages I know exist.

https://docs.kernel.org/gpu/drm-kms.html#plane-composition-properties
is where properties are documented for userspace developers to look at.

Let's see... I'm cheating and looking what hierarchy I need to follow
to find the place I am at:

The Linux Kernel
-> Subsystems
  -> Human Interfaces: GPU Driver Developer's Guide
    -> Kernel Mode Setting (KMS)
    <- oops, don't click that, take a step back
    -> Kernel Mode Setting (KMS): KMS properties
    <- oops, don't click that, take a step back
    -> Kernel Mode Setting (KMS): KMS properties: Plane Composition Propert=
ies

So yeah, UAPI docs are under graphics driver developer's guide, inside
human interface subsystems.


Thanks,
pq

> [1]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html
>=20
> Thanks,
> Louis Chauvet
>=20
> > Disclaimer again to everyone else: I cannot tell if this is the correct
> > documentation or its inverse.
> >=20
> >=20
> > Thanks,
> > pq =20
>=20
>=20
>=20


--Sig_/3/Qm647ZkFj/Jf89mUkhkF3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYfs8sACgkQI1/ltBGq
qqcT8Q/+OBYf2NAZgLUekE+MvjRISG6F4JGzL5Yyb4Cn9ngO/DNT2gNAIrjqYvqW
G1cHKG5F9PBK7kuAIpWvD5Xu9vNxdKMCIQjY4NkW/wex5ywF8Kv0oMjYgzzlyiXQ
siWcMiZLgnPffvMSBhlJwRbHTHIUreGcXO2AZ8DuDGxLLaDXRdIULf1KDgta4xKF
KDpE9Pf4w27Vz7gdr5tJUkPuQPNd5cwnGlRbU1U2F7qWhrUikK3ujfQJLVqTSltR
X97P4lEWPZTCMypas1YII1GklZEHyS2Kz9ov7CHlGAeLPVDss0LNb34t2MD/uHWT
k3SR9WYiNtzp9ooMQFaw8JRZJb7u/taIJZeJYW0+P4l0nSQh2RITs2m/v5RfeZNU
/+IdkmTTrHDGUKHrs4/eY9Z/HX7ojZWpwo5lWPXuBIMTrf4YvqXlJkXKL59unqAU
HrEU3BwluurOjhxerr1hJt2+rof+m8wbW9c9VLqXMTb59udJtgQ9lZJXCU4oytSD
eoqd3iCnVBJ+u5G1McZG8S0B0qwGC/pYxXNRgrdW1cV2Eo5YjqVocO7kPr4PcI5s
IWJMsxduVL3P3VvZ1FvWPuqp5DwGMI7JQ9kU03RTb5NJ+9egOhBp0YylAgQmDPX8
g+YuoJX4ZtPVGGyBvrHXFFEDfmb8SayhrC5ysBaPJiKdAyr/Yd4=
=AWgn
-----END PGP SIGNATURE-----

--Sig_/3/Qm647ZkFj/Jf89mUkhkF3--
