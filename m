Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222380A736
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4620E10EAB1;
	Fri,  8 Dec 2023 15:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617D010EAB1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:20:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D8FC5B82E03;
 Fri,  8 Dec 2023 15:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFA9C433C8;
 Fri,  8 Dec 2023 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702048840;
 bh=rE25Kd4ZppKlZHlVd7BElOL8jV3QmlRTZALrKLgJyR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/zFBg5TdKTIKJ40pxuEFQkTZKDTBbTDJ+N1CE8guX8KoFyx4eOKFYSHznQIkZrSd
 T7V8016q+UrjGn2pbkhNXThm4+u1WA2I7n1kdeqzQbasMu/ruk27oTts/gSNOex3fl
 vEE3ZgHmxgMncJNRkPMCc5V/cEuMI81zLX4F3hOXVt1QX5srprVyQGoeHjzdsKhdLX
 v6MP4p63gIeW97xJy9CKRzwWly+WkLUy+HY+/1CqXWM65dWW4t7Sq/X+J0yf7Awu01
 wzp0PD3b2tsmFaoKK4tQQwFafigiqCpX5REEMO5NfWLf1mP9eE6pkvGaOd36ZLYl28
 KXoaibxxo93iw==
Date: Fri, 8 Dec 2023 16:20:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <ohy2e56obfcsclujv7ti6ch6ev4dlvqwrg332woa2jxt4azfoo@g2lozla4yfn5>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
 <ifwxqdd5rwn33kkxzhwfwbvrsvh53h3cc3un26r5eoluho6e7t@bje7nzxfqvzo>
 <20231208100828.2155d1bd.pekka.paalanen@collabora.com>
 <6m6c7qctjkecsr2duwjjmkk26g6fqgmt7dcywho5kv6wysexzi@o7owf3zvy7gg>
 <20231208155946.4ea13179.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fybh6zfenywhmeah"
Content-Disposition: inline
In-Reply-To: <20231208155946.4ea13179.pekka.paalanen@collabora.com>
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


--fybh6zfenywhmeah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 03:59:46PM +0200, Pekka Paalanen wrote:
> On Fri, 8 Dec 2023 13:25:22 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Fri, Dec 08, 2023 at 10:08:28AM +0200, Pekka Paalanen wrote:
> > > On Thu, 7 Dec 2023 15:27:33 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > On Tue, Dec 05, 2023 at 10:51:06AM +0200, Pekka Paalanen wrote: =20
> > > > > On Mon,  4 Dec 2023 13:17:06 +0100
> > > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > > >    =20
> > > > > > The current documentation of drm_atomic_state says that it's th=
e "global
> > > > > > state object". This is confusing since, while it does contain a=
ll the
> > > > > > objects affected by an update and their respective states, if a=
n object
> > > > > > isn't affected by this update it won't be part of it.
> > > > > >=20
> > > > > > Thus, it's not truly a "global state", unlike object state stru=
ctures
> > > > > > that do contain the entire state of a given object.
> > > > > >=20
> > > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > ---
> > > > > >  include/drm/drm_atomic.h | 10 +++++++++-
> > > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > > > > index 914574b58ae7..81ad7369b90d 100644
> > > > > > --- a/include/drm/drm_atomic.h
> > > > > > +++ b/include/drm/drm_atomic.h
> > > > > > @@ -346,11 +346,19 @@ struct __drm_private_objs_state {
> > > > > >  };
> > > > > > =20
> > > > > >  /**
> > > > > > - * struct drm_atomic_state - the global state object for atomi=
c updates
> > > > > > + * struct drm_atomic_state - Atomic Update structure
> > > > > > + *
> > > > > > + * This structure is the kernel counterpart of @drm_mode_atomi=
c and contains
> > > > > > + * all the objects affected by an atomic modeset update and th=
eir states.   =20
> > > > >=20
> > > > > Drop "modeset"? An update can be without a modeset.   =20
> > > >=20
> > > > Yeah, good point
> > > >  =20
> > > > > >   *
> > > > > >   * States are added to an atomic update by calling drm_atomic_=
get_crtc_state(),
> > > > > >   * drm_atomic_get_plane_state(), drm_atomic_get_connector_stat=
e(), or for
> > > > > >   * private state structures, drm_atomic_get_private_obj_state(=
).
> > > > > > + *
> > > > > > + * NOTE: While this structure looks to be global and affecting=
 the whole DRM
> > > > > > + * device, it only contains the objects affected by the atomic=
 commit.   =20
> > > > >=20
> > > > > This new phrasing is much more clear to me than the old one.   =
=20
> > > >=20
> > > > Great
> > > >  =20
> > > > > > + * Unaffected objects will not be part of that update, unless =
they have been
> > > > > > + * explicitly added by either the framework or the driver.   =
=20
> > > > >=20
> > > > > If the framework or a driver adds an object, then it's no longer
> > > > > unaffected, is it?   =20
> > > >=20
> > > > I guess what I meant to say is that it's affected as a side effect =
that
> > > > the userspace cannot anticipate.
> > > >=20
> > > > The typical example being that changing a property on a connector w=
ould
> > > > need to pull the CRTC into the update to disable / enable the CRTC,
> > > > encoder and connector. =20
> > >=20
> > > Right, that's the easy case. This can even be documented and therefore
> > > become expected by userspace. The associations between CRTC and
> > > connector are published, e.g. the current routing.
> > >=20
> > > What I was thinking of was much more hidden:
> > >=20
> > > Userspace explicitly programs CRTC A and the connector connected to i=
t.
> > > None of the mentioned KMS objects in that atomic commit refer to CRTC=
 B
> > > in any way, not in old nor in new device state. Still, the driver
> > > decides to pull CRTC B in, because it needs to adjust something there
> > > (ISTR hearing "watermarks" in some conversation) in order to
> > > accommodate changes in CRTC A.
> > >=20
> > > So there are two categories of pulling in extra KMS objects: knowable
> > > and unknowable. Or expected and unexpected.
> > >=20
> > > If userspace changes things on a connector connected to CRTC A, you c=
an
> > > expect to pull in CRTC A. That's knowable. If the driver unexpectedly
> > > also pulls in CRTC B while userspace made absolutely no explicit nor
> > > implicit reference to it, that's unknowable. =20
> >=20
> > > The unknowable/unexpected additions are very hardware and driver
> > > specific and not reliably determinable from an atomic commit UAPI
> > > structure. =20
> >=20
> > So I had a quick look at all the drivers we have in-tree, and it looks
> > to be either a plane or a connector pulling its CRTC in. I guess they
> > would all qualify as knowable.
>=20
> Yes.
>=20
> > For unknowable, yeah, it's kind of bad, but at the same time you have to
> > deal with the hardware you have. Like, for vc4 for example, there's a
> > single controller before the CRTCs that deals with the blending, scaling
> > and all the other stuff. That controller has a limited number of FIFOs
> > and muxes to output the result of the blending to the right CRTC.
> >=20
> > So if you commit something on one CRTC, you might very well wait for
> > another one to complete because some hidden state (to userspace) is
> > shared between the two and you just can't run them in parallel.
> >=20
> > So yeah... We should strive to make it as transparent to userspace as
> > possible, but I also don't think we can express all the variations we
> > support.
>=20
> I do not expect this could be prevented. It's important to acknowledge
> that this can happen, even if it cannot be specified when it happens.

Ack.

> It's also important to document the requirement, like maybe it's not ok
> to pull in unexpected CRTCs without ALLOW_MODESET? Maybe there is
> already a check in DRM core for this?
>=20
> If userspace is using per-CRTC flip completion events, then userspace
> must always know before-hand which flip events it's going to get
> eventually.
>=20
> If userspace is using non-blocking commits (async is yet another
> dimension), then the kernel pulling in an unexpected CRTC will risk
> userspace failing its next commit on the unexpected CRTC with EBUSY.
>=20
> When userspace uses non-blocking commits, it practically always also
> expects flip events.
>=20
> I don't know how ALLOW_MODESET + non-blocking should work. If it pulls
> in unexpected CRTCs, will userspace also get unexpected flip events, or
> is it only prone to EBUSY?
>=20
> I would guess that unexpected flip events are avoided, and the expected
> flip event is just delayed until unexpected CRTCs have completed as
> well?

Those are all good questions, and the answer is... I don't know, sorry :/

> > > > As far as userspace is concerned, only the connector will be affect=
ed,
> > > > and only the connector will initially be part of the drm_atomic_sta=
te.
> > > >=20
> > > > But then some part of the atomic_check logic will pull the CRTC int=
o the
> > > > update. =20
> > >=20
> > > Is this a rule that happens always? If so, it can be documented to ma=
ke
> > > it expected.
> > >  =20
> > > > It's still invisible to userspace, so I guess
> > > > "unaffected-but-turns-out-to-be-affected" would be the right term :)
> > > >=20
> > > > Would something like:
> > > >=20
> > > > Unaffected objects will not be part of the initial update, but migh=
t be
> > > > added explicitly by either the framework or the driver during
> > > > atomic_check.
> > > >=20
> > > > be better? =20
> > >=20
> > > I'm not comfortable with the use of "unaffected" here. I'd be more in
> > > the direction of: More objects can be affected than explicitly
> > > mentioned. =20
> >=20
> > I think Sima's suggestion uses a different phrasing that should be much
> > better. Can you check if it works for you?
>=20
> Sima's phrasing is an addition, not a replacement, to this. There are
> two things:
>=20
> a) An atomic commit does not need to contain all the objects of a
>    drm_device.
>=20
> b) An atomic commit may affect more objects than it originally
>    contained. (from userspace perspective)
>=20
> Here b) is important for userspace to know, because it can be
> surprising, but I understand that this patch is not userspace doc.

Right, so my initial goal from this series was to make sure the
ambiguous meaning of what a state was was (hopefully) lifted, and thus
we could progress on your userspace doc patch. So I want to address
point A here.

B is also important, but maybe we should discuss it into a separate
patch?

Maxime

--fybh6zfenywhmeah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXM0RQAKCRDj7w1vZxhR
xZ2DAP0ZxliqI6+D6FAz2g2OhOOy/GHjmISWUXWa5BfEa6aC6gEAljPe3AIZgQPY
nwM7aqQyoMulg+SpKndrhhOtx85JJAY=
=klhW
-----END PGP SIGNATURE-----

--fybh6zfenywhmeah--
