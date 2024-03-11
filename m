Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D442C877FAE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 13:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1023310E790;
	Mon, 11 Mar 2024 12:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dloQrcOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6117710E790
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 12:10:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D81CACE0D55;
 Mon, 11 Mar 2024 12:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2D8C433F1;
 Mon, 11 Mar 2024 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710159027;
 bh=9qWXx17ikIntTOyse8M12B0v0qduGm1iZ4PJfXmIpkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dloQrcOnr8miZHkrYFRdr5F7iIWOqYnML3SiUDjAyIRIfEp74WSTrMeaCuFPWn8N5
 oc9CoE+pbo01kVwBvHz7N0Ustnz8sE0pCzoFbo0pZ68bcsddndteBAcKlYBJrSGhla
 20AQ7DRDlEiPyjRrgeHvd1V/WjDmT6uUP/+bc1oBw35Y5ibYw1WL58XdPZW6HHn9nX
 mVSs54f6e/rIyvFTzqPvOwRtwbtfL/ZHWLp8S6RT2ghUBll8o1ve7N7z7WlxVe5/ai
 gmwF13/wOcomvgulTJJs/+uu1/ov805xXRDvQjNUGAb7ym4DF4p1TNZdmV2Ntn/cV4
 30AxntOEULiqA==
Date: Mon, 11 Mar 2024 13:10:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Document requirements for driver-specific KMS props
 in new drivers
Message-ID: <20240311-nostalgic-tungsten-warthog-c4c561@houat>
References: <20240229202833.198691-1-sebastian.wick@redhat.com>
 <20240306-hulking-funky-fox-b9581b@houat>
 <20240306165009.GB11561@toolbox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="axw6wumxavhxptqy"
Content-Disposition: inline
In-Reply-To: <20240306165009.GB11561@toolbox>
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


--axw6wumxavhxptqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Wed, Mar 06, 2024 at 05:50:09PM +0100, Sebastian Wick wrote:
> On Wed, Mar 06, 2024 at 03:14:15PM +0100, Maxime Ripard wrote:
> > On Thu, Feb 29, 2024 at 09:28:31PM +0100, Sebastian Wick wrote:
> > > When extending support for a driver-specific KMS property to addition=
al
> > > drivers, we should apply all the requirements for new properties and
> > > make sure the semantics are the same and documented.
> > >=20
> > > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> > > ---
> > >  Documentation/gpu/drm-kms.rst | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-km=
s.rst
> > > index 13d3627d8bc0..afa10a28035f 100644
> > > --- a/Documentation/gpu/drm-kms.rst
> > > +++ b/Documentation/gpu/drm-kms.rst
> > > @@ -496,6 +496,11 @@ addition to the one mentioned above:
> > > =20
> > >  * An IGT test must be submitted where reasonable.
> > > =20
> > > +For historical reasons, non-standard, driver-specific properties exi=
st. If a KMS
> > > +driver wants to add support for one of those properties, the require=
ments for
> > > +new properties apply where possible. Additionally, the documented be=
havior must
> > > +match the de facto semantics of the existing property to ensure comp=
atibility.
> > > +
> >=20
> > I'm conflicted about this one, really.
> >=20
> > On one hand, yeah, it's definitely reasonable and something we would
> > want on the long run.
> >=20
> > But on the other hand, a driver getting its technical debt worked on for
> > free by anyone but its developpers doesn't seem fair to me.
>=20
> Most of the work would have to be done for a new property as well. The
> only additional work is then documenting the de-facto semantics and
> moving the existing driver-specific code to the core.

Sure, I think part of the problem with the Broadcast RGB property was
also that it hasn't been reviewed by anyone when it was submitted for
vc4.

> Would it help if we spell out that the developers of the driver-specific
> property shall help with both tasks?

Yes, that's a good idea, and we should probably require that the
maintainers of the driver that first added that property ack the
"standardization" work too.

> > Also, I assume this is in reaction to the discussion we had on the
> > Broadcast RGB property. We used in vc4 precisely because there was some
> > userspace code to deal with it and we could just reuse it, and it was
> > documented. So the requirements were met already.
>=20
> It was not in drm core and the behavior was not documented properly at
> least.
>=20
> Either way, with Broadcast RGB we were already in a bad situation
> because it was implemented by 2 drivers independently. This is what I
> want to avoid in the first place. The cleanup afterwards (thank you!)
> just exposed the problem.

Actually, I just found out there's three, the third one not being
compatible at all with the other two:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/gma500/cdv_d=
evice.c#L471

I'll send a patch to figure that one out once the rest will be merged.

Maxime

--axw6wumxavhxptqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZe70rwAKCRDj7w1vZxhR
xQxYAP9q1SJBPEiMwDRctpVhP8hqW4wSqfU9lWtFR0RFBytb2QEAhtpGLd/0R/wf
65kAq73rt4zUgIctaaBFIM6jbgbl4Qs=
=V+zm
-----END PGP SIGNATURE-----

--axw6wumxavhxptqy--
