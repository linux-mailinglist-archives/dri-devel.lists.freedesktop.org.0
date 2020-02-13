Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347F15BB3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 10:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CE16F572;
	Thu, 13 Feb 2020 09:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6AED6F572
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 09:10:48 +0000 (UTC)
Received: from localhost (p54B33627.dip0.t-ipconnect.de [84.179.54.39])
 by pokefinder.org (Postfix) with ESMTPSA id 06EB52C08AC;
 Thu, 13 Feb 2020 10:10:48 +0100 (CET)
Date: Thu, 13 Feb 2020 10:10:47 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: i2c: jz4780: silence log flood on txabrt
Message-ID: <20200213091047.GB2123@ninjato>
References: <cover.1581457290.git.hns@goldelico.com>
 <7facef52af9cff6ebe26ff321a7fd4f1ac640f74.1581457290.git.hns@goldelico.com>
 <20200212094628.GB1143@ninjato>
MIME-Version: 1.0
In-Reply-To: <20200212094628.GB1143@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Richard Fontana <rfontana@redhat.com>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alex Smith <alex.smith@imgtec.com>,
 Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>, devicetree@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 Allison Randal <allison@lohutok.net>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com, "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============1611234162=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1611234162==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 10:46:28AM +0100, Wolfram Sang wrote:
>=20
> The printout for txabrt is way too talkative. Reduce it to the minimum,
> the rest can be gained by I2C core debugging and datasheet information.
> Also, make it a debug printout, it won't help the regular user.
>=20
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Applied to for-current, thanks!


--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5FEpcACgkQFA3kzBSg
KbaDmg/+LPu/HFCGDpbL6wSNLy+ddtuDJAdLMW+RLR22jamJt0hmY7Yq5ZkUOeXf
SxZakdTgTh2D20e4hIEePPUa/cU9TaqfFl67OoLwaIMSVxJn2drOIKKPjqnr5Wbr
bKX/GhVDAWzBDvg1tMMFZM1G056Q2t+wU5yePYnGdccwFdiak3BKE/Cve3cwSDyq
hrUIy3ktDy481Cx7q8Lls9rgNGdHEkFPp9cwwT/GkPuPeVOSVQHsZpDcpjlAcMF2
EkPOTN5o4aRLaFU2zoH+3k6vR+Mf/2KkArKvw8sR4cTVidZ/nqfJIE98Od9vOOGw
qMm6JT5bns80N9MbRG21RCZ73yDyFChPk1OthQybZrmMB9WPwGshenRXqgX4IxZh
HRK8HV3d9xRnACbbYsg1SHGtFy0W+FNzU0DEqw5Vg4gZ8P24ZTUEYMghO7BIcv25
e0qVDNa0DveRvh1zcAGkTB2y0wUDd+Ti3X4/pcIN9FKiAArG5YpGy8YJf4jgfVEP
gSeLCyfGrT0rJEzORfLo6dw4VrRqr6znBQ0Wk8IQP5++mXxXx5QN7ybNwflu+z/M
v1579VU4ne2tK8J/+PDZPgciFc8Aj+U8ncDq/zE1+0SdL6HNCXnKO0fh321KgSyK
cFOdRG+9zHBTeV67Gtr4Y/DrKCyacPDTgctE2SLT2FZXRvPwGpw=
=dZR8
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

--===============1611234162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1611234162==--
