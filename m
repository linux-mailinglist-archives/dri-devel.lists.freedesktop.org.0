Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D974C36F28E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 00:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4CE6F4D7;
	Thu, 29 Apr 2021 22:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0DF6F4D7;
 Thu, 29 Apr 2021 22:23:38 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FWVQD6QWDz9sVv;
 Fri, 30 Apr 2021 08:23:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1619735015;
 bh=oVYsnHHSjeLFJK4aqp+l/3D9t0MToGTq9ET4RhlCdug=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Edy1xN/6FEmkai3FVJFoyC1XoDQr8L0lehd3jyv588ccl3Nko1z5a5+sI+hR5dWr/
 Ryzhm9KVr5XFyA7NN1ozBfDUuiisfeDDmiOdGDDJQwPcBWkTjJQqkj4fJ22xkuiENs
 827voTQt8qACPNRnDxlaOd9w5ut8fNRDJfLa/lZw+qLN8F8TyUGnC1FwnL/6rhDdna
 tuv3LaeC04W/awQ4Rr/bx+JjKfCCSxD1Nl0IcX7WzJs9wtteWfmb7Dm4viWtwv7jMV
 mc1/12TX2i2KhwhWi8eYL29kaZWzKT0Nn1azOGw1UPFe889ojpjPcQNIkRd4akJXhb
 pPEEFHzTxEKzg==
Date: Fri, 30 Apr 2021 08:23:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20210430082321.3bd9c4a5@canb.auug.org.au>
In-Reply-To: <20210318125241.5fdfeffd@canb.auug.org.au>
References: <20210317140824.0a28ffec@canb.auug.org.au>
 <20210318125241.5fdfeffd@canb.auug.org.au>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1949301824=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1949301824==
Content-Type: multipart/signed; boundary="Sig_/U9G.1q+RgpaZBkQfi4BGkVF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U9G.1q+RgpaZBkQfi4BGkVF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Mar 2021 12:52:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Wed, 17 Mar 2021 14:08:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the drm-intel tree got a conflict in:
> >=20
> >   drivers/gpu/drm/i915/display/intel_sprite.c
> >=20
> > between commit:
> >=20
> >   92f1d09ca4ed ("drm: Switch to %p4cc format modifier")
> >=20
> > from the drm tree and commit:
> >=20
> >   46d12f911821 ("drm/i915: migrate skl planes code new file (v5)")
> >=20
> > from the drm-intel tree.
> >=20
> > I fixed it up (I used the latter version of the file and applied the
> > following patch) and can carry the fix as necessary. This is now fixed
> > as far as linux-next is concerned, but any non trivial conflicts should
> > be mentioned to your upstream maintainer when your tree is submitted for
> > merging.  You may also want to consider cooperating with the maintainer
> > of the conflicting tree to minimise any particularly complex conflicts.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 17 Mar 2021 14:05:42 +1100
> > Subject: [PATCH] merge fix for "drm: Switch to %p4cc format modifier"
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drive=
rs/gpu/drm/i915/display/skl_universal_plane.c
> > index 1f335cb09149..45ceff436bf7 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -1120,7 +1120,6 @@ static int skl_plane_check_fb(const struct intel_=
crtc_state *crtc_state,
> >  	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
> >  	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
> >  	unsigned int rotation =3D plane_state->hw.rotation;
> > -	struct drm_format_name_buf format_name;
> > =20
> >  	if (!fb)
> >  		return 0;
> > @@ -1168,9 +1167,8 @@ static int skl_plane_check_fb(const struct intel_=
crtc_state *crtc_state,
> >  		case DRM_FORMAT_XVYU12_16161616:
> >  		case DRM_FORMAT_XVYU16161616:
> >  			drm_dbg_kms(&dev_priv->drm,
> > -				    "Unsupported pixel format %s for 90/270!\n",
> > -				    drm_get_format_name(fb->format->format,
> > -							&format_name));
> > +				    "Unsupported pixel format %p4cc for 90/270!\n",
> > +				    &fb->format->format);
> >  			return -EINVAL;
> >  		default:
> >  			break;
> > --=20
> > 2.30.0 =20
>=20
> The above fix up patch now needs to be applied to the drm tree.

I am still applying the above patch, but it applies to Linus' tree now.

--=20
Cheers,
Stephen Rothwell

--Sig_/U9G.1q+RgpaZBkQfi4BGkVF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCLMdkACgkQAVBC80lX
0GwLGQgApUtuvWzc9MWXmPyM5lIRZ5AqoaS5IAuWaHu6AdJVGm8nlxoG6VRLRg2V
0adtxkBFmCIMkAc3CMWkimWTOG4zqnJLZ2LZsTQvyF/0LXv1s4x8bkH+x/q1xusw
xnyAEAVRubSFtmOREyYkukeThqINxe0t1dJqvW9ZGYQpbarUOEdxBbEg41eVX1Tm
0UoqC6eaFkgdc8942LjnvomsXx7JCsuRgxyyK6vXJVeZ1osEQ2roBegB82VQDYiq
MXyMqwt4zOGpOzJjDfr6X47FNOR11kCE3EaJesSZ+otGTETrD0FCCQmqFXs+ONK9
W88hNJiK1n6tHW3Xy58EIC26+SLj5g==
=xR97
-----END PGP SIGNATURE-----

--Sig_/U9G.1q+RgpaZBkQfi4BGkVF--

--===============1949301824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1949301824==--
