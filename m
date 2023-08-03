Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6129E76E4AA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 11:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8101D10E0DA;
	Thu,  3 Aug 2023 09:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6BB10E0DA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 09:38:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9663861D15;
 Thu,  3 Aug 2023 09:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A84C433C7;
 Thu,  3 Aug 2023 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691055511;
 bh=M7mKv7aFom4lStcfY4aW++sZ1R7wmmAzxjw85MUjNDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ILvlrqdelXLsQ94SKYibc+TpHrnegKXc1xtybeWaEJOYmGgq1eX4rzESkLuMcVuJ0
 7nSBnBCt7wbbGd0S+wPwKV8XjX7ch+9opQSP3uKR3fUW1Z47OUtzMDHXNNMwNr/RuH
 uV8gUP7p327Gi/1faGdYXIPOY7lFPw/F+g5ETgci34A6FZ1IeNMvUHRrJQp0y+OWx5
 NzdR6938SLhAu54kd4dRNxSvgOjqigi0YXAScsIKaAx224bGdjgLTN+/DACng+bguA
 hARqk/iCof8jz/I0zv/HXG0XBykPvPNN4ev/Ob1x6jkiPPc9WUrjsrQSIUWliTmOCr
 4wqgBzNBDDJKA==
Date: Thu, 3 Aug 2023 11:38:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Message-ID: <teag3fdr7i65wzenovlcytnnpgk2gunzyq6wmci33g7csoasvz@tyyp6h7pqswk>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
 <ekmwiy3iuvtqtb6hwjbba2ia3aemt3dxmx6dj3zh6ljfmuim4w@4jzhqdenxth4>
 <ZMtqraOyGN9JvVj9@phenom.ffwll.local>
 <qmwtcungahbe2bhty7v2rso2kf3vai6k47muwipifbybmi7o6s@oj6lngnhyhtg>
 <9f0670a7-6ef6-7823-19c2-de10683f303f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iqykblsj6nj6m3cz"
Content-Disposition: inline
In-Reply-To: <9f0670a7-6ef6-7823-19c2-de10683f303f@linaro.org>
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
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iqykblsj6nj6m3cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 11:30:52AM +0200, Neil Armstrong wrote:
> On 03/08/2023 11:22, Maxime Ripard wrote:
> > On Thu, Aug 03, 2023 at 10:51:57AM +0200, Daniel Vetter wrote:
> > > On Thu, Aug 03, 2023 at 10:48:57AM +0200, Maxime Ripard wrote:
> > > > On Thu, Aug 03, 2023 at 10:11:22AM +0200, Neil Armstrong wrote:
> > > > > Hi,
> > > > >=20
> > > > > On 18/07/2023 17:31, Michael Riesch wrote:
> > > > > > Hi all,
> > > > > >=20
> > > > > > This series adds support for the partial display mode to the Si=
tronix
> > > > > > ST7789V panel driver. This is useful for panels that are partia=
lly
> > > > > > occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Su=
pport
> > > > > > for this particular panel is added as well.
> > > > > >=20
> > > > > > Note: This series is already based on
> > > > > > https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kerne=
l.org/
> > > > >=20
> > > > > I understand Maxime's arguments, but by looking closely at the co=
de,
> > > > > this doesn't look like an hack at all and uses capabilities of the
> > > > > panel controller to expose a smaller area without depending on any
> > > > > changes or hacks on the display controller side which is coherent.
> > > > >=20
> > > > > Following's Daniel's summary we cannot compare it to TV overscan
> > > > > because overscan is only on *some* displays, we can still get 100%
> > > > > of the picture from the signal.
> > > >=20
> > > > Still disagree on the fact that it only affects some display. But i=
t's
> > > > not really relevant for that series.
> > >=20
> > > See my 2nd point, from a quick grep aside from i915 hdmi support, no =
one
> > > else sets all the required hdmi infoframes correctly. Which means on a
> > > compliant hdmi tv, you _should_ get overscan. That's how that stuff is
> > > speced.
> > >=20
> > > Iirc you need to at least set both the VIC and the content type, maybe
> > > even more stuff.
> > >=20
> > > Unless all that stuff is set I'd say it's a kms driver bug if you get
> > > overscan on a hdmi TV.
> >=20
> > I have no doubt that i915 works there. The source of my disagreement is
> > that if all drivers but one don't do that, then userspace will have to
> > care. You kind of said it yourself, i915 is kind of the exception there.
> >=20
> > The exception can be (and I'm sure it is) right, but still, it deviates
> > from the norm.
>=20
> HDMI spec is hidden behind a paywall, HDMI testing is a mess, HDMI real
> implementation on TVs and Displays is mostly broken, and HDMI certificati=
on
> devices are too expensive... this is mainly why only i915 handles it corr=
ectly.

Sure, I know all that, it's why I was disagreeing with the fact that
it's mostly old news and we shouldn't care anymore. And it could largely
be fixed if i915 was using more helpers in general.

But that's a separate discussion entirely. The point I was trying to
make is that it's still very much the current situation for the vast
majority of drivers, for whatever reason, so we can't really treat as if
it isn't anymore.

> > > > I think I'll still like to have something clarified before we merge=
 it:
> > > > if userspace forces a mode, does it contain the margins or not? I d=
on't
> > > > have an opinion there, I just think it should be documented.
> > >=20
> > > The mode comes with the margins, so if userspace does something really
> > > funny then either it gets garbage (as in, part of it's crtc area isn't
> > > visible, or maybe black bars on the screen), or the driver rejects it
> > > (which I think is the case for panels, they only take their mode and
> > > nothing else).
> >=20
> > Panels can usually be quite flexible when it comes to the timings they
> > accept, and we could actually use that to our advantage, but even if we
> > assume that they have a single mode, I don't think we have anything that
> > enforces that, either at the framework or documentation levels?
>=20
> Yep, this is why we would need a better atomic based panel API that would
> permit us handling dynamic timings for panel and get out of the single-mo=
de
> for modern panels.

Again, I definitely agree on the new API, but that seems a bit out of
scope :)

My point was that we can't expect modes to be the one we provided in
=2Eget_modes. And that's for all the drivers, even i915 doesn't do it (as
far as I could see)

Maxime

--iqykblsj6nj6m3cz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMt1lAAKCRDj7w1vZxhR
xQMaAPwNXMv/pcq5vo5GVXn54SaI8sUtQ/LzmvdqFrXqkE3MNwEAvFr+U9cZYjDw
s1xrtXXgBzW8oBHSoQuxtTTLKhFzYAs=
=JLy4
-----END PGP SIGNATURE-----

--iqykblsj6nj6m3cz--
