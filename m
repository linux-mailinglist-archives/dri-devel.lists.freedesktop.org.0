Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB3A80A4F0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 14:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3D310E066;
	Fri,  8 Dec 2023 13:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FF110E066
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 13:59:51 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A62A66073BF;
 Fri,  8 Dec 2023 13:59:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702043990;
 bh=I/Gs4DOPMwLXxji1ab3FoQPE984PiBsh1IIip63pOzE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kVwKfvfesTIUnvzsMYJbMEQILPoeEAkDaDVYCsrKYttS5F5gL3jetv84H2cqStvCi
 4ew9fGngei7H54gsxwPKTI65zm0PDNf6RoEsbWavDKY0UAH0FWuL5lv7R5pewiLE7t
 akAEygooxxJZJcTG3J34NyvMuhppsqMyAxUuy50RUC7wgN+yF+jX5lWicBjuCyq5ko
 sHwVMfaFEtBfPNrqD8oh5uJLuXRL/LLMVyQGeuKhRpD2DecYetbMs5Kg23QS7qA3ap
 fCVeRgV9ESvChOLzajh7EBR0uJlUD0e3Ls/uZZNmOPYoDVMsNdQZ/XHVuZuZrSqQd4
 yvdI+Je0dwvgQ==
Date: Fri, 8 Dec 2023 15:59:46 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <20231208155946.4ea13179.pekka.paalanen@collabora.com>
In-Reply-To: <6m6c7qctjkecsr2duwjjmkk26g6fqgmt7dcywho5kv6wysexzi@o7owf3zvy7gg>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
 <ifwxqdd5rwn33kkxzhwfwbvrsvh53h3cc3un26r5eoluho6e7t@bje7nzxfqvzo>
 <20231208100828.2155d1bd.pekka.paalanen@collabora.com>
 <6m6c7qctjkecsr2duwjjmkk26g6fqgmt7dcywho5kv6wysexzi@o7owf3zvy7gg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4lASF3RhN0ExjPigvf_dV2G";
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/4lASF3RhN0ExjPigvf_dV2G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 8 Dec 2023 13:25:22 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Dec 08, 2023 at 10:08:28AM +0200, Pekka Paalanen wrote:
> > On Thu, 7 Dec 2023 15:27:33 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> > > On Tue, Dec 05, 2023 at 10:51:06AM +0200, Pekka Paalanen wrote: =20
> > > > On Mon,  4 Dec 2023 13:17:06 +0100
> > > > Maxime Ripard <mripard@kernel.org> wrote:
> > > >    =20
> > > > > The current documentation of drm_atomic_state says that it's the =
"global
> > > > > state object". This is confusing since, while it does contain all=
 the
> > > > > objects affected by an update and their respective states, if an =
object
> > > > > isn't affected by this update it won't be part of it.
> > > > >=20
> > > > > Thus, it's not truly a "global state", unlike object state struct=
ures
> > > > > that do contain the entire state of a given object.
> > > > >=20
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > >  include/drm/drm_atomic.h | 10 +++++++++-
> > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > > > index 914574b58ae7..81ad7369b90d 100644
> > > > > --- a/include/drm/drm_atomic.h
> > > > > +++ b/include/drm/drm_atomic.h
> > > > > @@ -346,11 +346,19 @@ struct __drm_private_objs_state {
> > > > >  };
> > > > > =20
> > > > >  /**
> > > > > - * struct drm_atomic_state - the global state object for atomic =
updates
> > > > > + * struct drm_atomic_state - Atomic Update structure
> > > > > + *
> > > > > + * This structure is the kernel counterpart of @drm_mode_atomic =
and contains
> > > > > + * all the objects affected by an atomic modeset update and thei=
r states.   =20
> > > >=20
> > > > Drop "modeset"? An update can be without a modeset.   =20
> > >=20
> > > Yeah, good point
> > >  =20
> > > > >   *
> > > > >   * States are added to an atomic update by calling drm_atomic_ge=
t_crtc_state(),
> > > > >   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(=
), or for
> > > > >   * private state structures, drm_atomic_get_private_obj_state().
> > > > > + *
> > > > > + * NOTE: While this structure looks to be global and affecting t=
he whole DRM
> > > > > + * device, it only contains the objects affected by the atomic c=
ommit.   =20
> > > >=20
> > > > This new phrasing is much more clear to me than the old one.   =20
> > >=20
> > > Great
> > >  =20
> > > > > + * Unaffected objects will not be part of that update, unless th=
ey have been
> > > > > + * explicitly added by either the framework or the driver.   =20
> > > >=20
> > > > If the framework or a driver adds an object, then it's no longer
> > > > unaffected, is it?   =20
> > >=20
> > > I guess what I meant to say is that it's affected as a side effect th=
at
> > > the userspace cannot anticipate.
> > >=20
> > > The typical example being that changing a property on a connector wou=
ld
> > > need to pull the CRTC into the update to disable / enable the CRTC,
> > > encoder and connector. =20
> >=20
> > Right, that's the easy case. This can even be documented and therefore
> > become expected by userspace. The associations between CRTC and
> > connector are published, e.g. the current routing.
> >=20
> > What I was thinking of was much more hidden:
> >=20
> > Userspace explicitly programs CRTC A and the connector connected to it.
> > None of the mentioned KMS objects in that atomic commit refer to CRTC B
> > in any way, not in old nor in new device state. Still, the driver
> > decides to pull CRTC B in, because it needs to adjust something there
> > (ISTR hearing "watermarks" in some conversation) in order to
> > accommodate changes in CRTC A.
> >=20
> > So there are two categories of pulling in extra KMS objects: knowable
> > and unknowable. Or expected and unexpected.
> >=20
> > If userspace changes things on a connector connected to CRTC A, you can
> > expect to pull in CRTC A. That's knowable. If the driver unexpectedly
> > also pulls in CRTC B while userspace made absolutely no explicit nor
> > implicit reference to it, that's unknowable. =20
>=20
> > The unknowable/unexpected additions are very hardware and driver
> > specific and not reliably determinable from an atomic commit UAPI
> > structure. =20
>=20
> So I had a quick look at all the drivers we have in-tree, and it looks
> to be either a plane or a connector pulling its CRTC in. I guess they
> would all qualify as knowable.

Yes.

> For unknowable, yeah, it's kind of bad, but at the same time you have to
> deal with the hardware you have. Like, for vc4 for example, there's a
> single controller before the CRTCs that deals with the blending, scaling
> and all the other stuff. That controller has a limited number of FIFOs
> and muxes to output the result of the blending to the right CRTC.
>=20
> So if you commit something on one CRTC, you might very well wait for
> another one to complete because some hidden state (to userspace) is
> shared between the two and you just can't run them in parallel.
>=20
> So yeah... We should strive to make it as transparent to userspace as
> possible, but I also don't think we can express all the variations we
> support.

I do not expect this could be prevented. It's important to acknowledge
that this can happen, even if it cannot be specified when it happens.
It's also important to document the requirement, like maybe it's not ok
to pull in unexpected CRTCs without ALLOW_MODESET? Maybe there is
already a check in DRM core for this?

If userspace is using per-CRTC flip completion events, then userspace
must always know before-hand which flip events it's going to get
eventually.

If userspace is using non-blocking commits (async is yet another
dimension), then the kernel pulling in an unexpected CRTC will risk
userspace failing its next commit on the unexpected CRTC with EBUSY.

When userspace uses non-blocking commits, it practically always also
expects flip events.

I don't know how ALLOW_MODESET + non-blocking should work. If it pulls
in unexpected CRTCs, will userspace also get unexpected flip events, or
is it only prone to EBUSY?

I would guess that unexpected flip events are avoided, and the expected
flip event is just delayed until unexpected CRTCs have completed as
well?

> > > As far as userspace is concerned, only the connector will be affected,
> > > and only the connector will initially be part of the drm_atomic_state.
> > >=20
> > > But then some part of the atomic_check logic will pull the CRTC into =
the
> > > update. =20
> >=20
> > Is this a rule that happens always? If so, it can be documented to make
> > it expected.
> >  =20
> > > It's still invisible to userspace, so I guess
> > > "unaffected-but-turns-out-to-be-affected" would be the right term :)
> > >=20
> > > Would something like:
> > >=20
> > > Unaffected objects will not be part of the initial update, but might =
be
> > > added explicitly by either the framework or the driver during
> > > atomic_check.
> > >=20
> > > be better? =20
> >=20
> > I'm not comfortable with the use of "unaffected" here. I'd be more in
> > the direction of: More objects can be affected than explicitly
> > mentioned. =20
>=20
> I think Sima's suggestion uses a different phrasing that should be much
> better. Can you check if it works for you?

Sima's phrasing is an addition, not a replacement, to this. There are
two things:

a) An atomic commit does not need to contain all the objects of a
   drm_device.

b) An atomic commit may affect more objects than it originally
   contained. (from userspace perspective)

Here b) is important for userspace to know, because it can be
surprising, but I understand that this patch is not userspace doc.


Thanks,
pq

--Sig_/4lASF3RhN0ExjPigvf_dV2G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzIVIACgkQI1/ltBGq
qqdOUhAAmlvgB9/gFIUzbVPoUwJbOnGNDgFJu7lxXGWHO9iPYYOTv12jIg4s13v0
IQ0HErNXnw06xzbUpe6KoCxLUQMUD8KfCHf9K1Ts06XIMjc5C57Sg7BUZiuIrHzK
dPlIIVOJuP9qw7UobPMZKLM2CnnNt+eyCFzdOKWImWUjVlvvm7K1sajlmWulCuSB
CG1nyzkEEQBXqJq6xWZ8WOCxHJXOvGwyv6fK36aqsqHtqLbey4ynr9sNELYga/A0
3tE4hvlIFYMsBmoJpzfnRUFIA5aO9+cglOZkP80TwEr7WFvXHkTY5DfScumINGGA
CXEtEdfQIkISEqssy3RSJ5/mmffbJ7TxPM0Pz/Q1uPnSo4wGUt34okAe8c8muwEv
f+DyGUVo1bqdTaqTT56GGZfmNzf5h2XFSOwvlSmqK7q5ZPQhU//K+ze/i2V510c7
zUlo5RyBM0jH+3PfvyWnza874iU5+K5Dk6eFakCRBesBntI80dZat91c3hqSc/gu
ru9wVOKFh8O0iU9Te+aRfSOJqq2ysmgygUBVAzzbWdNguxgMe4BaLmlVPf12jn6Q
j67qLFcDvSjIW8vGIbeIxl8qOCTYPeKmp6xiJVLlVFXHm6SqclNBQ7VLB2sZosvM
8G7GMb+cRihOy4/DaXa0UkxL4cg+dlVMt7Ic3cRmVt+kloHV7sE=
=Rry9
-----END PGP SIGNATURE-----

--Sig_/4lASF3RhN0ExjPigvf_dV2G--
