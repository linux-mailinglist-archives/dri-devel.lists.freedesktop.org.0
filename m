Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED8376E43F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED28510E040;
	Thu,  3 Aug 2023 09:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C3110E040
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 09:22:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE5B161CE5;
 Thu,  3 Aug 2023 09:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3546C433C7;
 Thu,  3 Aug 2023 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691054563;
 bh=cDmDQ8IkJZfXXy9N2FqpfneiI87FSMvPq0LWI6XcjdY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=KxV+ZVVlSs9VQfoNtjLUjd+jQ4ttlo3PnspBD5VRFXFBd4r/ieW5v2lpzqGGecg3D
 1DLEoyK4bdkQXm/e77LYwxuDbSJVYMTToNhztNBbgJyts0HMu639ceNZW/LJNz1Mr/
 2lAbOjKYIvejy2jaNYMmS3K4TzskRdm8y7ce5tjOSufH3f8qUc+r7ex+wKHVJZQRTp
 5aA+0KKl9vmxEzp4OgWP9kuDuXM7PPq1TeAx5z6h2C7YmOw4IgoaImduwZLvPIHCKV
 ZliBT+k+c51SgZt7IJ121Hvumlzw9aooWtzyDGpN4CxlhvZ2OT5687/+KDPntDCA6E
 0tyo9Cm0HheOw==
Date: Thu, 3 Aug 2023 11:22:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sre@kernel.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 David Airlie <airlied@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Message-ID: <qmwtcungahbe2bhty7v2rso2kf3vai6k47muwipifbybmi7o6s@oj6lngnhyhtg>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
 <ekmwiy3iuvtqtb6hwjbba2ia3aemt3dxmx6dj3zh6ljfmuim4w@4jzhqdenxth4>
 <ZMtqraOyGN9JvVj9@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="747cy4c36hkubsom"
Content-Disposition: inline
In-Reply-To: <ZMtqraOyGN9JvVj9@phenom.ffwll.local>
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


--747cy4c36hkubsom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 10:51:57AM +0200, Daniel Vetter wrote:
> On Thu, Aug 03, 2023 at 10:48:57AM +0200, Maxime Ripard wrote:
> > On Thu, Aug 03, 2023 at 10:11:22AM +0200, Neil Armstrong wrote:
> > > Hi,
> > >=20
> > > On 18/07/2023 17:31, Michael Riesch wrote:
> > > > Hi all,
> > > >=20
> > > > This series adds support for the partial display mode to the Sitron=
ix
> > > > ST7789V panel driver. This is useful for panels that are partially
> > > > occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Support
> > > > for this particular panel is added as well.
> > > >=20
> > > > Note: This series is already based on
> > > > https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.or=
g/
> > >=20
> > > I understand Maxime's arguments, but by looking closely at the code,
> > > this doesn't look like an hack at all and uses capabilities of the
> > > panel controller to expose a smaller area without depending on any
> > > changes or hacks on the display controller side which is coherent.
> > >=20
> > > Following's Daniel's summary we cannot compare it to TV overscan
> > > because overscan is only on *some* displays, we can still get 100%
> > > of the picture from the signal.
> >=20
> > Still disagree on the fact that it only affects some display. But it's
> > not really relevant for that series.
>=20
> See my 2nd point, from a quick grep aside from i915 hdmi support, no one
> else sets all the required hdmi infoframes correctly. Which means on a
> compliant hdmi tv, you _should_ get overscan. That's how that stuff is
> speced.
>=20
> Iirc you need to at least set both the VIC and the content type, maybe
> even more stuff.
>=20
> Unless all that stuff is set I'd say it's a kms driver bug if you get
> overscan on a hdmi TV.

I have no doubt that i915 works there. The source of my disagreement is
that if all drivers but one don't do that, then userspace will have to
care. You kind of said it yourself, i915 is kind of the exception there.

The exception can be (and I'm sure it is) right, but still, it deviates
=66rom the norm.

> > I think I'll still like to have something clarified before we merge it:
> > if userspace forces a mode, does it contain the margins or not? I don't
> > have an opinion there, I just think it should be documented.
>=20
> The mode comes with the margins, so if userspace does something really
> funny then either it gets garbage (as in, part of it's crtc area isn't
> visible, or maybe black bars on the screen), or the driver rejects it
> (which I think is the case for panels, they only take their mode and
> nothing else).

Panels can usually be quite flexible when it comes to the timings they
accept, and we could actually use that to our advantage, but even if we
assume that they have a single mode, I don't think we have anything that
enforces that, either at the framework or documentation levels?

Maxime

--747cy4c36hkubsom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMtx3wAKCRDj7w1vZxhR
xeToAQCUDopfDyd7vCfNpnPjT1j+PM0tpoS2T52jRiD9h1IgKAEAiAZxUoDl6bpB
bwelJPn2NL0fxTgPR8My3Na4LT8yCgE=
=1DIx
-----END PGP SIGNATURE-----

--747cy4c36hkubsom--
