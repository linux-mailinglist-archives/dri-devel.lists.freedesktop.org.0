Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D43280A31F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 13:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934A789496;
	Fri,  8 Dec 2023 12:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7952F89496
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 12:25:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B59F6CE26E7;
 Fri,  8 Dec 2023 12:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C8CC433C7;
 Fri,  8 Dec 2023 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702038325;
 bh=ZcGI/f7wcEjc044HQZR1oz/kp1eYna2+Sq+JPNF/JuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Huhhxb9tF19l9YVfDWGJkKJScLNTYwy860pNgJ/5HGeSbBAYsgI9plUYk1U7c4sYo
 1EKsQBHiRRv0v53FowyRU2UzFQm1+Z3f3umPfVhBNkwoecSt7GYAUqYyDfAaPluP0E
 Vu0vrRTntVpEvySRz17nffyYoAetPA5h5CSNYLJeSciVfTURIboV995cA6VhUVW+Kv
 4s3XrrVyf7ioA2tL1Ny4BC3c/ka5mAYITWMxtsyhcv7HHEaHL90B2IwUGY2PNHFpzR
 lE89CEfMXAMAN9mpNLYrFuQ+2kHao7+RWIl7hOvl9bNgWZSsjQIbMS5u57HqNnmzqm
 ge4v7bmEVkzxA==
Date: Fri, 8 Dec 2023 13:25:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <6m6c7qctjkecsr2duwjjmkk26g6fqgmt7dcywho5kv6wysexzi@o7owf3zvy7gg>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
 <ifwxqdd5rwn33kkxzhwfwbvrsvh53h3cc3un26r5eoluho6e7t@bje7nzxfqvzo>
 <20231208100828.2155d1bd.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jbkwyoklhxih62to"
Content-Disposition: inline
In-Reply-To: <20231208100828.2155d1bd.pekka.paalanen@collabora.com>
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jbkwyoklhxih62to
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 10:08:28AM +0200, Pekka Paalanen wrote:
> On Thu, 7 Dec 2023 15:27:33 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Tue, Dec 05, 2023 at 10:51:06AM +0200, Pekka Paalanen wrote:
> > > On Mon,  4 Dec 2023 13:17:06 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > The current documentation of drm_atomic_state says that it's the "g=
lobal
> > > > state object". This is confusing since, while it does contain all t=
he
> > > > objects affected by an update and their respective states, if an ob=
ject
> > > > isn't affected by this update it won't be part of it.
> > > >=20
> > > > Thus, it's not truly a "global state", unlike object state structur=
es
> > > > that do contain the entire state of a given object.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  include/drm/drm_atomic.h | 10 +++++++++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > > index 914574b58ae7..81ad7369b90d 100644
> > > > --- a/include/drm/drm_atomic.h
> > > > +++ b/include/drm/drm_atomic.h
> > > > @@ -346,11 +346,19 @@ struct __drm_private_objs_state {
> > > >  };
> > > > =20
> > > >  /**
> > > > - * struct drm_atomic_state - the global state object for atomic up=
dates
> > > > + * struct drm_atomic_state - Atomic Update structure
> > > > + *
> > > > + * This structure is the kernel counterpart of @drm_mode_atomic an=
d contains
> > > > + * all the objects affected by an atomic modeset update and their =
states. =20
> > >=20
> > > Drop "modeset"? An update can be without a modeset. =20
> >=20
> > Yeah, good point
> >=20
> > > >   *
> > > >   * States are added to an atomic update by calling drm_atomic_get_=
crtc_state(),
> > > >   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(),=
 or for
> > > >   * private state structures, drm_atomic_get_private_obj_state().
> > > > + *
> > > > + * NOTE: While this structure looks to be global and affecting the=
 whole DRM
> > > > + * device, it only contains the objects affected by the atomic com=
mit. =20
> > >=20
> > > This new phrasing is much more clear to me than the old one. =20
> >=20
> > Great
> >=20
> > > > + * Unaffected objects will not be part of that update, unless they=
 have been
> > > > + * explicitly added by either the framework or the driver. =20
> > >=20
> > > If the framework or a driver adds an object, then it's no longer
> > > unaffected, is it? =20
> >=20
> > I guess what I meant to say is that it's affected as a side effect that
> > the userspace cannot anticipate.
> >=20
> > The typical example being that changing a property on a connector would
> > need to pull the CRTC into the update to disable / enable the CRTC,
> > encoder and connector.
>=20
> Right, that's the easy case. This can even be documented and therefore
> become expected by userspace. The associations between CRTC and
> connector are published, e.g. the current routing.
>=20
> What I was thinking of was much more hidden:
>=20
> Userspace explicitly programs CRTC A and the connector connected to it.
> None of the mentioned KMS objects in that atomic commit refer to CRTC B
> in any way, not in old nor in new device state. Still, the driver
> decides to pull CRTC B in, because it needs to adjust something there
> (ISTR hearing "watermarks" in some conversation) in order to
> accommodate changes in CRTC A.
>=20
> So there are two categories of pulling in extra KMS objects: knowable
> and unknowable. Or expected and unexpected.
>=20
> If userspace changes things on a connector connected to CRTC A, you can
> expect to pull in CRTC A. That's knowable. If the driver unexpectedly
> also pulls in CRTC B while userspace made absolutely no explicit nor
> implicit reference to it, that's unknowable.

> The unknowable/unexpected additions are very hardware and driver
> specific and not reliably determinable from an atomic commit UAPI
> structure.

So I had a quick look at all the drivers we have in-tree, and it looks
to be either a plane or a connector pulling its CRTC in. I guess they
would all qualify as knowable.

For unknowable, yeah, it's kind of bad, but at the same time you have to
deal with the hardware you have. Like, for vc4 for example, there's a
single controller before the CRTCs that deals with the blending, scaling
and all the other stuff. That controller has a limited number of FIFOs
and muxes to output the result of the blending to the right CRTC.

So if you commit something on one CRTC, you might very well wait for
another one to complete because some hidden state (to userspace) is
shared between the two and you just can't run them in parallel.

So yeah... We should strive to make it as transparent to userspace as
possible, but I also don't think we can express all the variations we
support.

> > As far as userspace is concerned, only the connector will be affected,
> > and only the connector will initially be part of the drm_atomic_state.
> >=20
> > But then some part of the atomic_check logic will pull the CRTC into the
> > update.
>=20
> Is this a rule that happens always? If so, it can be documented to make
> it expected.
>=20
> > It's still invisible to userspace, so I guess
> > "unaffected-but-turns-out-to-be-affected" would be the right term :)
> >=20
> > Would something like:
> >=20
> > Unaffected objects will not be part of the initial update, but might be
> > added explicitly by either the framework or the driver during
> > atomic_check.
> >=20
> > be better?
>=20
> I'm not comfortable with the use of "unaffected" here. I'd be more in
> the direction of: More objects can be affected than explicitly
> mentioned.

I think Sima's suggestion uses a different phrasing that should be much
better. Can you check if it works for you?

Maxime

--jbkwyoklhxih62to
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXMLMgAKCRDj7w1vZxhR
xabyAQDLLvmL/lZpczef28LMEg7uC3JSD/c8NSOe3PX/dDJd1QEAj0mBCmgl/OCt
Z3aTPGTbQWLggKJOSUS1xt2UUUTvJAU=
=NVXL
-----END PGP SIGNATURE-----

--jbkwyoklhxih62to--
