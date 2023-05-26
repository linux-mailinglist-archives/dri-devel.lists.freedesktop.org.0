Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DB712D7E
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 21:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9872510E1EE;
	Fri, 26 May 2023 19:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4A510E069
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 19:30:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E45764CB6;
 Fri, 26 May 2023 19:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CD6C433D2;
 Fri, 26 May 2023 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685129409;
 bh=E2ymAixpCMhmvg82kXyaNqZ8PtU6kQdKGqCK4Ky+qR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bnleaV9/PW+Gfb2yBInrTWVOzE7wP6XryCDvv+WDUFt8lMdKOz8jgrDd22SKLSgfq
 u68zdjSqIqqrD8of0PB03aa2XQKl3CXUa+RgWhAhOU5S6fMag+h7j1EnEjrVVVrtk0
 7RZYX67mfhlgqDJIhixFw2Lt91/OxoiA4OGonYXtp2P8xpPIfkasCd+ZIlD/Mr/nv9
 plH3gEB05+AR4C3eF8LZMF+KxmS2aqDA7Q4rdg6Ya68gwrS9oGYIcHqX8xnWm3NfT7
 nid8CO2lLb7CtMEjRp2w+3N9j6Uhy5R+sPYw+YjzNz6CTeW3cEVcI44ThpFK1jw7EJ
 ca+vRN0UUZldg==
Date: Fri, 26 May 2023 20:30:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V8 7/7] dt-bindings: bridge: samsung-dsim: Make some
 flags optional
Message-ID: <20230526-lily-underwent-1dc0be746be0@spud>
References: <20230526030559.326566-1-aford173@gmail.com>
 <20230526030559.326566-8-aford173@gmail.com>
 <20230526-cabana-humble-81e44944e378@spud>
 <CAHCN7xJdfO4+q071sur7wpVg+gU_Fzw9zfXvM9NDBFCN=Axiog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ea1i9TW6U0SJFPcf"
Content-Disposition: inline
In-Reply-To: <CAHCN7xJdfO4+q071sur7wpVg+gU_Fzw9zfXvM9NDBFCN=Axiog@mail.gmail.com>
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
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ea1i9TW6U0SJFPcf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 02:24:21PM -0500, Adam Ford wrote:
> On Fri, May 26, 2023 at 1:19=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Thu, May 25, 2023 at 10:05:59PM -0500, Adam Ford wrote:

> > >      description:
> > > -      DSIM high speed burst mode frequency.
> > > +      DSIM high speed burst mode frequency when connected to devices
> > > +      that support burst mode. If absent, the driver will use the pi=
xel
> > > +      clock from the attached device or bridge.
> >
> > I'd rather this description did not say anything about drivers.
> > How about:
> >         If absent, the pixel clock from the attached device or bridge
> >         will be used instead.
>=20
> That makes sense.  I can do that.
>=20
> "DSIM high speed burst mode frequency (optional). If absent, the pixel
> clock from the attached device or bridge will be used instead."
>=20
> > Or perhaps "must be used"? Ditto below.
>=20
> "Must be" implies to me that the user needs to set something.  Are you
> ok with the proposed suggestion above?
> >
> > Description aside, the removal seems to be backwards compatible - but
> > can every device that this binding supports work using an "attached
> > device or bridge", or are these properties going to be required for
> > certain compatibles?
>=20
> From what I can tell, the assumption is that the DSIM driver was
> expecting it to attach to panels in the past.  With the additional
> patch series, the DSIM can attach to bridge parts without a hard-coded
> set of clocks.  I don't expect the existing Exynos devices to change,
> but I also don't know what would preclude those SoC's from attaching
> to a bridge should someone want to design a new product around them.

Okay, that seems fair. With your revised wording,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> I'll wait a couple days for more feedback and send patch V2 with just
> this patch since the rest of the series has been applied to the drm
> branch.

Sounds good. Krzysztof will hopefully be able to take a look then too to
make sure I am not making a hames of things.

Thanks,
Conor.


--ea1i9TW6U0SJFPcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHEIuwAKCRB4tDGHoIJi
0kD6AP0Y3Fb4jz2+LQ4l61bqCHLoDp9idgedhnetgyg2PMbi+wEAtcM+wWmX4sbO
Q4BBRx5/pAGiS3iyEfZD3hQPKaXTcwE=
=gkTU
-----END PGP SIGNATURE-----

--ea1i9TW6U0SJFPcf--
