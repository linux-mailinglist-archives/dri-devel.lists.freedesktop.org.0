Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A429A8316B6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 11:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB3E10E6F5;
	Thu, 18 Jan 2024 10:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A2410E6F5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 10:33:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 982B4B816EA;
 Thu, 18 Jan 2024 10:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9183AC433F1;
 Thu, 18 Jan 2024 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705574025;
 bh=uASjuwIQJia/sBSbG9K5pW4SpDoSruIEuqH+uTdFLSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=trQonasKmlA0Bn6TtZBcrX/ThtzmJRzU7buxFuSqYC9cDjgDWlsTWii/0aGO7smHs
 2RDRBZ6boNsO4yZlrD8Z41AMbOkjScsDzdGwtGwghe2g6QSd5KyNUzy6/RoVBRG2hT
 grIAHxcjinDNHd1CHs6E9a/SvqPQkNKDFfK5GFX+8hJMZBO49wEJSRE+mGxo4+Dwqt
 dcq2+ilbXFxnvDkoa2TYklFkCRgMlukrxwOvKHKadG9MBjjtF7wW6HPWWpNAzh6nqp
 1O40bywfquql6GLK0C1FJ3NTuYXw0GTRchdeOz8SkbVUVKCeo/jPxEK7YnGkp8LfBf
 8WgYmDdqiWyiA==
Date: Thu, 18 Jan 2024 11:33:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Re: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
Message-ID: <evrz2pixfsze6a4splahb3tgfwqlo22qxyfmvrcxlkwvdl5our@rk4o3qrfo6i5>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-7-jfalempe@redhat.com>
 <ZaFCWUwxpxv5B0AM@phenom.ffwll.local>
 <koiw5xzpcmjgg3grprd6qlm2sidt4mylqiv6aycnqvayylpexb@5viaz5qishhj>
 <d46b3361-297f-4361-bc6b-68c4109a63aa@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="flzsvr3gvk2pxls6"
Content-Disposition: inline
In-Reply-To: <d46b3361-297f-4361-bc6b-68c4109a63aa@suse.de>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 noralf@tronnes.org, Daniel Vetter <daniel@ffwll.ch>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--flzsvr3gvk2pxls6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 04:22:01PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 12.01.24 um 14:58 schrieb Maxime Ripard:
> > On Fri, Jan 12, 2024 at 02:44:57PM +0100, Daniel Vetter wrote:
> > > On Thu, Jan 04, 2024 at 05:00:50PM +0100, Jocelyn Falempe wrote:
> > > > Add support for the drm_panic module, which displays a user-friendly
> > > > message to the screen when a kernel panic occurs.
> > > >=20
> > > > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > > > ---
> > > >   drivers/gpu/drm/tiny/simpledrm.c | 15 +++++++++++++++
> > > >   1 file changed, 15 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tin=
y/simpledrm.c
> > > > index 7ce1c4617675..6dd2afee84d4 100644
> > > > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > > > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > > > @@ -25,6 +25,7 @@
> > > >   #include <drm/drm_gem_shmem_helper.h>
> > > >   #include <drm/drm_managed.h>
> > > >   #include <drm/drm_modeset_helper_vtables.h>
> > > > +#include <drm/drm_panic.h>
> > > >   #include <drm/drm_probe_helper.h>
> > > >   #define DRIVER_NAME	"simpledrm"
> > > > @@ -985,6 +986,19 @@ static struct simpledrm_device *simpledrm_devi=
ce_create(struct drm_driver *drv,
> > > >   	return sdev;
> > > >   }
> > > > +static int simpledrm_get_scanout_buffer(struct drm_device *dev,
> > > > +					struct drm_scanout_buffer *sb)
> > > > +{
> > > > +	struct simpledrm_device *sdev =3D simpledrm_device_of_dev(dev);
> > >=20
> > > So I guess simpledrm is the reason why the get_scanout_buffer hook is=
 at
> > > the device level and not at the plane level. Even from the few driver=
s you
> > > have in your series it seems very much the exception, so I'm not sure
> > > whether that's the best design.
> > >=20
> > > I guess we'll know when we see the plane iterator code with the right
> > > locking, whether it's ok to have that in driver hooks or it's better =
to
> > > pull it out into shared code.
> >=20
> > Wouldn't the CRTC level be better than the planes?
>=20
> What's in favor of the CRTC level?
>=20
> I'd put a hook at the plane level and do the
> drm_for_each_primary_visible_plane() in the panic handler. Simpledrm would
> fit into this pattern nicely.
>=20
> But it's not like I have strong feeling about this. The current callbacks
> are simple enough.

An active CRTC is guaranteed to have an active plane, and knows what the
full blending story is. An active plane does have a CRTC too, but there
might be other planes we want to consider, and if you're doing blending
with multiple primary planes it will get quite funny very fast :)

Plus, some CRTC have internal SRAMs we could use as fallback in the case
where we won't be able to get a proper framebuffer.

Maxime

--flzsvr3gvk2pxls6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaj+hgAKCRDj7w1vZxhR
xfoLAP9AiDrJo1p/LIRlw9kP2/VOWRIQVWL8Vl5ClofIWWL8tQD/VLYt5U/fcm65
lv1cLHk1xESEW6H4ZSQw6cspgjfrPAY=
=3hi3
-----END PGP SIGNATURE-----

--flzsvr3gvk2pxls6--
