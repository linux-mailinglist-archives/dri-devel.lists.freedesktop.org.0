Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62059C6DA6C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE49510E17C;
	Wed, 19 Nov 2025 09:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="obPz9g+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4536A10E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 09:19:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4BF1F60166;
 Wed, 19 Nov 2025 09:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652FEC113D0;
 Wed, 19 Nov 2025 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763543949;
 bh=wOUDEHv50QeY3FIrd9AfcYgSOCVxnuSxty9Ry2TtVvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=obPz9g+WuAabjrRdMJDYwairl2+ZFFW6joxWYFgnfAxZIaIFbEk6okcgu0eOhLRgB
 ImIZtE7NO/WdZZvxT14W6FI1zB43t/JyyraQd7HzfV2+nM438RtbZGSKYRvg33BYRN
 bnAao8l9mPURwmAVvTFqc1H6ZhJdXEsw4I2TkNtgtK/UOw7XRd5axB6awUN+uC1IQr
 hsh4oyfhZcuRIHymh4HoTzTZ8fPc6uySj8hsJyCfxBlrLDeKJfFkhfTMIG0AXF1RFq
 Je6gx/4aNcCRrO+oT3Kz0KEV6fzv4Hbk47QXZzbKn5RBGzp+yLbkNX7dpbb+fMLrsS
 MIoyHDKLGx4Dg==
Date: Wed, 19 Nov 2025 10:19:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Message-ID: <5zo76nnejrinmf6snaezld5ylfvk266bwyxg3phdhtg74z43pu@kub3r7tvz7vc>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
 <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
 <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mdtg53pqx5wf23le"
Content-Disposition: inline
In-Reply-To: <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
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


--mdtg53pqx5wf23le
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:10:47PM +0100, Linus Walleij wrote:
> On Tue, Nov 18, 2025 at 4:44=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> > > On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
>=20
> > > > +/**
> > > > + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic u=
pdate
> > >
> > > Based on the function name, it feels that the nem commit tail and
> > > modeset enable/disable helpers reached a point where we may want to
> > > reconsider the design instead of adding new functions with small
> > > differences in behaviour that will end up confusing driver developers.
> >
> > Agreed, and I'd go even further than that: we don't want every odd order
> > in the core. And if some driver has to break the order we document in
> > some way it should be very obvious.
>=20
> Is this just a comment on this patch 3/3?
>=20
> Or do you mean that Mareks new callback
> drm_atomic_helper_commit_modeset_enables_crtc_early()
> from patch 1/2 should go straight into the R-Car driver as well
> and that
> drm_atomic_helper_commit_modeset_disables_crtc_late()
> patch 2/2 should also go into my driver, even if this
> is a comment on patch 3/3?
>=20
> Both patches 1 & 2 have a lot to do with ordering, this is
> why I ask.

I mean, it applies to all your three patches and Marek's: helpers are
here to provide a default implementation. We shouldn't provide a default
implementation for a single user. All your patches enable to create
defaults for a single user.

So my point is that none of those functions should be helpers.

> We already have
> drm_atomic_helper_commit_tail()
> drm_atomic_helper_commit_tail_rpm()

The former has 5 users, the latter 13. And it's already confusing enough
and regression-prone as it is.

> Does one more or less really matter? Maybe, I'm not sure,
> but if it's just this one patch that is the problem I can surely
> do it that way since we're only calling public functions.
>=20
> Pushing the first two patches would be more problematic,
> because they call a lot of functions that are local to the
> drm atomic helpers.

I'm totally fine with making more internal functions public though.

Maxime

--mdtg53pqx5wf23le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaR2LigAKCRAnX84Zoj2+
dtxqAYDdPYEZq97K88nQ3C5+pdqF3mplM7/pzobUoiptmBAHo6gJl9Oi8Bmjip90
2YfQ7SkBfjXMY5lEKwrwrC4vEaORBwu8p/gFJLAjck0ED2A/vgATl0Dfz3ucIVB1
WS2G3a7lwQ==
=71f/
-----END PGP SIGNATURE-----

--mdtg53pqx5wf23le--
