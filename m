Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B114CC754D5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AD810E785;
	Thu, 20 Nov 2025 16:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NfSDP/Df";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F0F10E783
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 16:20:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4614B403A5;
 Thu, 20 Nov 2025 16:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7714C16AAE;
 Thu, 20 Nov 2025 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763655600;
 bh=8f5zLlMjNGjBzd/6entD5aIPPBWnkaQUfjw9Eq1Jy14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NfSDP/DfuXZMEVxiD6DA0MVI4ci/ceTvXf7ANKsg/4brL5lc/n62xphZQjONgqtFK
 2l0Oz69Uy4HDwy+x0d8eawS03z+mApQ2uN/R754ZYQ3IWl5CmO4rOod4j4wc8Pxzd0
 m8o6SB+8Pn3YZ2hovLU/EWZz/c8JP+IFh5EhAEspOa9kQNU7g+aqu68fv4a9nwwp5c
 QCCjln+diXsF7U81Xrvg5+2+YM81kFz6mfxeulV11UYE08YLaXyYF4X1zpYaN4j0mH
 3IXaScSTCbFVqMLj5WqiwjuGqqQF0aSbge7riY/i7VeRDeDeqLuM3KR8kXYiVohkcX
 a9jvuivuDlDNA==
Date: Thu, 20 Nov 2025 17:19:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
Message-ID: <tcu23ayvadb3vtz6vksrrkw6rkngofxnhokaa4khat2grnqgcu@ttmqg6illoz7>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
 <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
 <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wopmgmmayr32ufyd"
Content-Disposition: inline
In-Reply-To: <19fc5a8e-999c-46a0-b755-0bd09fe84d92@ideasonboard.com>
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


--wopmgmmayr32ufyd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
MIME-Version: 1.0

On Wed, Nov 19, 2025 at 12:41:52PM +0200, Tomi Valkeinen wrote:
> Hi,
>=20
> On 19/11/2025 11:19, Maxime Ripard wrote:
> > On Tue, Nov 18, 2025 at 07:10:47PM +0100, Linus Walleij wrote:
> >> On Tue, Nov 18, 2025 at 4:44=E2=80=AFPM Maxime Ripard <mripard@kernel.=
org> wrote:
> >>> On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> >>>> On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
> >>
> >>>>> +/**
> >>>>> + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic u=
pdate
> >>>>
> >>>> Based on the function name, it feels that the nem commit tail and
> >>>> modeset enable/disable helpers reached a point where we may want to
> >>>> reconsider the design instead of adding new functions with small
> >>>> differences in behaviour that will end up confusing driver developer=
s.
> >>>
> >>> Agreed, and I'd go even further than that: we don't want every odd or=
der
> >>> in the core. And if some driver has to break the order we document in
> >>> some way it should be very obvious.
> >>
> >> Is this just a comment on this patch 3/3?
> >>
> >> Or do you mean that Mareks new callback
> >> drm_atomic_helper_commit_modeset_enables_crtc_early()
> >> from patch 1/2 should go straight into the R-Car driver as well
> >> and that
> >> drm_atomic_helper_commit_modeset_disables_crtc_late()
> >> patch 2/2 should also go into my driver, even if this
> >> is a comment on patch 3/3?
> >>
> >> Both patches 1 & 2 have a lot to do with ordering, this is
> >> why I ask.
> >=20
> > I mean, it applies to all your three patches and Marek's: helpers are
> > here to provide a default implementation. We shouldn't provide a default
> > implementation for a single user. All your patches enable to create
> > defaults for a single user.
>=20
> Two users so far: Renesas and ST-Ericsson.
>=20
> > So my point is that none of those functions should be helpers.
> >=20
> >> We already have
> >> drm_atomic_helper_commit_tail()
> >> drm_atomic_helper_commit_tail_rpm()
> >=20
> > The former has 5 users, the latter 13. And it's already confusing enough
> > and regression-prone as it is.
> >=20
> >> Does one more or less really matter? Maybe, I'm not sure,
> >> but if it's just this one patch that is the problem I can surely
> >> do it that way since we're only calling public functions.
> >>
> >> Pushing the first two patches would be more problematic,
> >> because they call a lot of functions that are local to the
> >> drm atomic helpers.
> >=20
> > I'm totally fine with making more internal functions public though.
> While I generally agree with that, I still wonder if an implementation
> in the core is better here. Perhaps a flag in struct drm_driver, instead
> of new set of helpers.
>=20
> Moving this to the driver would require (with a quick glance) exposing
> the following functions:
>=20
> crtc_enable
> crtc_disable
> crtc_set_mode
> encoder_bridge_pre_enable
> encoder_bridge_enable
> encoder_bridge_disable
> encoder_bridge_post_disable
>=20
> Not impossible to expose, but making a private function public does
> require work in validating the function for more general use, and adding
> kernel docs.

Those are pretty trivial to document though, compared to document how
the new variants differ from drm_atomic_helper_commit_tail() and
drm_atomic_helper_commit_tail_rpm(), and then validating that it does
indeed stay that way.

> Handling this in the core would act as documentation too, so instead of
> the driver doing things in a different way "hidden" inside the driver,
> it would be a standard quirk, clearly documented.

We've had the "let's not introduce helpers for a single user" rule for
like a decade at this point, because it simply doesn't scale. Plenty of
drivers have opted-out for very specific use-case already. I'm not sure
why we should create this precedent.

> Also, I'm also not sure how rare this quirk is. In fact, I feel we're
> missing ways to handle the enable/disable related issues in the core
> framework. In these patches we're talking about the case where the SoC's
> DSI host needs an incoming pclk to operate, and panels need to do
> configuration before the video stream is enabled. But the exact same
> problem could be present with an external DSI bridge, and then we can't
> fix it in the crtc driver.
>=20
> So the question becomes "does any component in the pipeline need the
> video stream's clock to operate". But then, it doesn't help if the crtc
> output is enabled early if any bridge in between does not also enable
> its output early. So it all gets a bit complex.
>=20
> And sometimes the clocks go backward: the entity on the downstream side
> provides a clock backwards, to the source entity...

Yes, you're right, this is why it's so fragile. Do you want to create
the test suite to check that all combinations are properly tested before
reworking the whole thing?

> But I digress. I think initially we should just look for a clean fix for
> the platforms affected:
>=20
> - Add the implementation into the drivers?
> - Add helpers to the core?
> - Add a flag of some kind so the core can do the right thing?
>=20
> I made a quick test with the flag approach, below. It's not many lines,
> but... Ugh, it does feel like a hack.

Because it is.

Really, I don't get it. I gave you a free pass to do whatever you wanted
in your driver. It doesn't add any maintenance burden on anyone. It
doesn't risk regressing other drivers in the process. It doesn't come
with any testing requirement. It doesn't even have to be reviewed by us,
really.

Why do you argue for a more bothersome (for everyone) solution?

Maxime

--wopmgmmayr32ufyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaR8/rAAKCRAnX84Zoj2+
dh3oAYC11UtpTMG6KDGtdCP75AeMIOGISGMhZbRGjJsyKe0tCTwwaOmZtoUSIPsR
9TKKwioBf1zpb/qajz0Jc7SmiA4yZXjZbpwhAqJSArIPmfEJyEHSRQ3uUd//KQkN
cgxrbIqvlw==
=KoYO
-----END PGP SIGNATURE-----

--wopmgmmayr32ufyd--
