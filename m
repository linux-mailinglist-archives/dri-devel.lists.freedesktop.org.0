Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29981260BB3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429C86E509;
	Tue,  8 Sep 2020 07:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47BD6E4E3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 18:21:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41EB1ABC4;
 Mon,  7 Sep 2020 18:21:28 +0000 (UTC)
Message-ID: <d2a344c2ffd38152d206d8c49ff519d4cc0ebbb3.camel@suse.de>
Subject: Re: [PATCH v5 00/80] drm/vc4: Support BCM2711 Display Pipeline
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Date: Mon, 07 Sep 2020 20:21:25 +0200
In-Reply-To: <20200907162232.kfkskjuytfr7dyef@gilmour.lan>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <20200907162232.kfkskjuytfr7dyef@gilmour.lan>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0657098867=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0657098867==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-6L8guC3lDLUqPbUr6fSR"


--=-6L8guC3lDLUqPbUr6fSR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Mon, 2020-09-07 at 18:22 +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Thu, Sep 03, 2020 at 10:00:32AM +0200, Maxime Ripard wrote:
> > Hi everyone,
> >=20
> > Here's a (pretty long) series to introduce support in the VC4 DRM drive=
r
> > for the display pipeline found in the BCM2711 (and thus the RaspberryPi=
 4).
> >=20
> > The main differences are that there's two HDMI controllers and that the=
re's
> > more pixelvalve now. Those pixelvalve come with a mux in the HVS that s=
till
> > have only 3 FIFOs. Both of those differences are breaking a bunch of
> > expectations in the driver, so we first need a good bunch of cleanup an=
d
> > reworks to introduce support for the new controllers.
> >=20
> > Similarly, the HDMI controller has all its registers shuffled and split=
 in
> > multiple controllers now, so we need a bunch of changes to support this=
 as
> > well.
> >=20
> > Only the HDMI support is enabled for now (even though the DPI and DSI
> > outputs have been tested too).
>=20
> I've applied the patches 1-79 to drm-misc. I guess the final DT patch
> should go through the arm-soc tree?

I'll take care of it tomorrow.

Regards,
Nicolas


--=-6L8guC3lDLUqPbUr6fSR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9WeiUACgkQlfZmHno8
x/4UyAf/dt+SI/8MNNE3iGPcEq4wiASX9vH8Hmce1FWMw6HaJbqDiyKW8RCr2rM5
XnDk/ekvzlwycIOkqwbnBOgETHs8Tn885jjA3i3gV9g62dB7ZCnyNRguRLoGftFO
iELFYgoiAtlJtR2r2eDeYZOaSLSoxMILSBF3CTEmldCleaSdBDrCIog3vHvXVpFa
1SPcP2e6j/pH4D0RhuabxSAN20WBJ9rHkwR5kL1+rbsKHIJufPnKdYC+q2xrSy3q
fF11Vx6oD1KNHIC0Eq0UmCCh4PVDbXMmV39S4OzbeuS9x8tgcRs8V3pA7cN5I2c3
5Fg3C7xN5Wp8cHaXm66xIZ0dVS4mCg==
=1K25
-----END PGP SIGNATURE-----

--=-6L8guC3lDLUqPbUr6fSR--


--===============0657098867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0657098867==--

