Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1988976E72B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 13:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DB110E12E;
	Thu,  3 Aug 2023 11:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C76910E12E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 11:43:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A176961D53;
 Thu,  3 Aug 2023 11:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826AFC433C8;
 Thu,  3 Aug 2023 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691062991;
 bh=9+RtIN6wxigYjMridZ3eGb8V8CqhNPEq56t9Do4SBe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LgzRWR/pxIxD1kIM2yxRXJvBPiq/JKiSHHDZZE32MO6gDL4jYrlw02euB6ahDFGxY
 fnEtgWXhsSHUkCwQ2bzyAB6of7MvKroNIaabEf4fg9ybjVu0EfA6tpaG/oXnzxJCH6
 kBOwcz5zekinskFlDs3Aq46BYLU7zkWw380cCb/G6Fn7ssaoG5z3fTo/9LVpTa3pnU
 zcs/vSPLvpwQvY5bOeTv81LAYAkeMpdMld6Ha3EdqoOETaWkcnhora5Tht5D/dXjwB
 lrXlzbqzka/wdi7WLjhu7Gl3hJWk+UCMykpajoa/5Nn6SWrLUwkpAiyFs7kXBDXZ3T
 8vGyyLxmOCuYQ==
Date: Thu, 3 Aug 2023 13:43:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Message-ID: <d2sgj2iap4ouu425buqkorx76kpdqh77k3z36vaegma67pciyv@n3mbiglfidxx>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
 <ekmwiy3iuvtqtb6hwjbba2ia3aemt3dxmx6dj3zh6ljfmuim4w@4jzhqdenxth4>
 <ZMtqraOyGN9JvVj9@phenom.ffwll.local>
 <qmwtcungahbe2bhty7v2rso2kf3vai6k47muwipifbybmi7o6s@oj6lngnhyhtg>
 <CAKMK7uFbQURKYvB2JWnwZDEeA-qURpx_GFqR1FxgtuvK7jX4TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qfwl5fgt5fndwmia"
Content-Disposition: inline
In-Reply-To: <CAKMK7uFbQURKYvB2JWnwZDEeA-qURpx_GFqR1FxgtuvK7jX4TA@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qfwl5fgt5fndwmia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 12:26:03PM +0200, Daniel Vetter wrote:
> On Thu, 3 Aug 2023 at 11:22, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Thu, Aug 03, 2023 at 10:51:57AM +0200, Daniel Vetter wrote:
> > > On Thu, Aug 03, 2023 at 10:48:57AM +0200, Maxime Ripard wrote:
> > > > On Thu, Aug 03, 2023 at 10:11:22AM +0200, Neil Armstrong wrote:
> > > > > Hi,
> > > > >
> > > > > On 18/07/2023 17:31, Michael Riesch wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > This series adds support for the partial display mode to the Si=
tronix
> > > > > > ST7789V panel driver. This is useful for panels that are partia=
lly
> > > > > > occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Su=
pport
> > > > > > for this particular panel is added as well.
> > > > > >
> > > > > > Note: This series is already based on
> > > > > > https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kerne=
l.org/
> > > > >
> > > > > I understand Maxime's arguments, but by looking closely at the co=
de,
> > > > > this doesn't look like an hack at all and uses capabilities of the
> > > > > panel controller to expose a smaller area without depending on any
> > > > > changes or hacks on the display controller side which is coherent.
> > > > >
> > > > > Following's Daniel's summary we cannot compare it to TV overscan
> > > > > because overscan is only on *some* displays, we can still get 100%
> > > > > of the picture from the signal.
> > > >
> > > > Still disagree on the fact that it only affects some display. But i=
t's
> > > > not really relevant for that series.
> > >
> > > See my 2nd point, from a quick grep aside from i915 hdmi support, no =
one
> > > else sets all the required hdmi infoframes correctly. Which means on a
> > > compliant hdmi tv, you _should_ get overscan. That's how that stuff is
> > > speced.
> > >
> > > Iirc you need to at least set both the VIC and the content type, maybe
> > > even more stuff.
> > >
> > > Unless all that stuff is set I'd say it's a kms driver bug if you get
> > > overscan on a hdmi TV.
> >
> > I have no doubt that i915 works there. The source of my disagreement is
> > that if all drivers but one don't do that, then userspace will have to
> > care. You kind of said it yourself, i915 is kind of the exception there.
> >
> > The exception can be (and I'm sure it is) right, but still, it deviates
> > from the norm.
>=20
> The right fix for these is sending the right infoframes, _not_ trying
> to fiddle with overscan margins. Only the kernel can make sure the
> right infoframes are sent out. If you try to paper over this in
> userspace, you'll make the situation worse, not better (because
> fiddling with overscan means you get scaling, and so rescaling
> artifacts, and for hard contrasts along pixel lines that'll look like
> crap).
>=20
> So yeah this is a case of "most upstream hdmi drivers are broken".
> Please don't try to fix kernel bugs in userspace.

ACK.

> > > > I think I'll still like to have something clarified before we merge=
 it:
> > > > if userspace forces a mode, does it contain the margins or not? I d=
on't
> > > > have an opinion there, I just think it should be documented.
> > >
> > > The mode comes with the margins, so if userspace does something really
> > > funny then either it gets garbage (as in, part of it's crtc area isn't
> > > visible, or maybe black bars on the screen), or the driver rejects it
> > > (which I think is the case for panels, they only take their mode and
> > > nothing else).
> >
> > Panels can usually be quite flexible when it comes to the timings they
> > accept, and we could actually use that to our advantage, but even if we
> > assume that they have a single mode, I don't think we have anything that
> > enforces that, either at the framework or documentation levels?
>=20
> Maybe more bugs? We've been slowly filling out all kinds of atomic kms
> validation bugs in core/helper code because as a rule of thumb,
> drivers get it wrong. Developers test until things work, then call it
> good enough, and very few driver teams make a serious effort in trying
> to really validate all invalid input. Because doing that is an
> enormous amount of work.
>=20
> I think for clear-cut cases like drm_panel the fix is to just put more
> stricter validation into shared code (and then if we break something,
> figure out how we can be sufficiently lenient again).

Panels are kind of weird, since they essentially don't exist at all in
the framework so it's difficult to make it handle them or their state.

It's typically handled by encoders directly, so each and every driver
would need to make that check, and from a quick grep, none of them are
(for the reasons you said).

Just like for HDMI, even though we can commit to changing those facts,
it won't happen overnight, so to circle back to that series, I'd like a
comment in the driver when the partial mode is enabled that if userspace
ever pushes a mode different from the expected one, we'll add the margins.

That way, if and when we come back to it, we'll know what the original
intent and semantics were.

Maxime

--qfwl5fgt5fndwmia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMuSzAAKCRDj7w1vZxhR
xTiFAQCAKpBWUi9Wf0twmjd0EmY3hQCjzZgTSj2tjvO0DPGrNQEA2BGgAZiYrOxU
oBGMArbzCsWvaYlN5mb8X8Vx97RSggA=
=8CCn
-----END PGP SIGNATURE-----

--qfwl5fgt5fndwmia--
