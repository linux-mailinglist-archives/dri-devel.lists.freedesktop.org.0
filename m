Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E776E8B1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6448110E08E;
	Thu,  3 Aug 2023 12:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6073610E08E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:44:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86E3961D49;
 Thu,  3 Aug 2023 12:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9848EC433C8;
 Thu,  3 Aug 2023 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691066675;
 bh=QBxv3qBXN9/E3wvwn5MR0wsDoKPtCS2zOkczh8tpeyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBjBSA7l3sDdf/7fOzX4+S0/7qIN2a1UfGvScxvUsvvnpXgk+n3+kk92KWOWr420W
 BMEqbNzVp4ESGn59OziDYGfIpKyhd989WUMu8iUcr+ZmwSZfjMQpGiKx44Ok8bDwJK
 qSSDTGmpPLlvGlwvT8r06TUdC76+Hi7VIYzdFzuM57htxE7BRMUCXgav8VmhgoXQMW
 XwUwOiOB56tXPV1fUtADRTXcjoGCfkI9a1ik6ttrtWHRzm8L4d/h+gPcNT/WNzA167
 lKGfdCcmaDYAQlznnZL8qgUdkUsRTaxYNWtxhBEoJmmldzz1jq7NJSm+HgRu/ZHjhh
 dT2U4+MVa9MmA==
Date: Thu, 3 Aug 2023 14:44:32 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Message-ID: <6x6wiyjqopz6nytv4wb6wn3iowhnwh2ce25v4v7n7xcwfzjk2a@4gsgjfqa44pt>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
 <ekmwiy3iuvtqtb6hwjbba2ia3aemt3dxmx6dj3zh6ljfmuim4w@4jzhqdenxth4>
 <ZMtqraOyGN9JvVj9@phenom.ffwll.local>
 <qmwtcungahbe2bhty7v2rso2kf3vai6k47muwipifbybmi7o6s@oj6lngnhyhtg>
 <CAKMK7uFbQURKYvB2JWnwZDEeA-qURpx_GFqR1FxgtuvK7jX4TA@mail.gmail.com>
 <d2sgj2iap4ouu425buqkorx76kpdqh77k3z36vaegma67pciyv@n3mbiglfidxx>
 <e8c395e4-23b7-b252-21a1-5f8f8c5c552a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hrr6rzrnikjkdjir"
Content-Disposition: inline
In-Reply-To: <e8c395e4-23b7-b252-21a1-5f8f8c5c552a@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hrr6rzrnikjkdjir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 02:34:58PM +0200, Neil Armstrong wrote:
> > > > > > I think I'll still like to have something clarified before we m=
erge it:
> > > > > > if userspace forces a mode, does it contain the margins or not?=
 I don't
> > > > > > have an opinion there, I just think it should be documented.
> > > > >=20
> > > > > The mode comes with the margins, so if userspace does something r=
eally
> > > > > funny then either it gets garbage (as in, part of it's crtc area =
isn't
> > > > > visible, or maybe black bars on the screen), or the driver reject=
s it
> > > > > (which I think is the case for panels, they only take their mode =
and
> > > > > nothing else).
> > > >=20
> > > > Panels can usually be quite flexible when it comes to the timings t=
hey
> > > > accept, and we could actually use that to our advantage, but even i=
f we
> > > > assume that they have a single mode, I don't think we have anything=
 that
> > > > enforces that, either at the framework or documentation levels?
> > >=20
> > > Maybe more bugs? We've been slowly filling out all kinds of atomic kms
> > > validation bugs in core/helper code because as a rule of thumb,
> > > drivers get it wrong. Developers test until things work, then call it
> > > good enough, and very few driver teams make a serious effort in trying
> > > to really validate all invalid input. Because doing that is an
> > > enormous amount of work.
> > >=20
> > > I think for clear-cut cases like drm_panel the fix is to just put more
> > > stricter validation into shared code (and then if we break something,
> > > figure out how we can be sufficiently lenient again).
> >=20
> > Panels are kind of weird, since they essentially don't exist at all in
> > the framework so it's difficult to make it handle them or their state.
> >=20
> > It's typically handled by encoders directly, so each and every driver
> > would need to make that check, and from a quick grep, none of them are
> > (for the reasons you said).
> >=20
> > Just like for HDMI, even though we can commit to changing those facts,
> > it won't happen overnight, so to circle back to that series, I'd like a
> > comment in the driver when the partial mode is enabled that if userspace
> > ever pushes a mode different from the expected one, we'll add the margi=
ns.
>=20
> To be fair, a majority of the panel drivers would do the wrong
> init of the controller with a different mode because:
> - mainly the controller model is unknown
> - when it's known the datasheet is missing
> - when the datasheet is here, most of the registers are missing
> - and most of the time the timings are buried in the init sequence
>=20
> It's sad but it's the real situation.

Again, I agree. As far as I'm aware, none of them add arbitrary numbers
to timings though, so it's easy enough to figure out what the mode is
meant to be: it's the mode. Here, we add some numbers to the mode, so
the interaction with the userspace forcing a mode is less clear.

> Only a few drivers can handle a different mode, and we should perhaps
> add a flag when not set rejecting a different mode for those controllers =
and
> mark the few ones who can handle that...
> And this should be a first step before adding an atomic Panel API.

I'm really just asking for a comment in the code here.

Everything that you mentioned are improvements that we should have on
our todo list, but I don't see them as pre-requisite for this series and
we get to it later on.

Maxime

--hrr6rzrnikjkdjir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMuhLwAKCRDj7w1vZxhR
xWM9AQD+q7nwioeLqvuLTy7EyE2QFTOY/Afbgj6fm6OTMMZ1awD+JyCCiP7jNIb8
otqd7ccpMdOLRvFno1dnyuj/TKaamgM=
=bpPs
-----END PGP SIGNATURE-----

--hrr6rzrnikjkdjir--
