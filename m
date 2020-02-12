Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6715AB60
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 15:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C066E060;
	Wed, 12 Feb 2020 14:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B4BB6E060
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 14:53:57 +0000 (UTC)
Received: from localhost (p54B335A7.dip0.t-ipconnect.de [84.179.53.167])
 by pokefinder.org (Postfix) with ESMTPSA id B1BB92C07EB;
 Wed, 12 Feb 2020 15:53:56 +0100 (CET)
Date: Wed, 12 Feb 2020 15:53:56 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: i2c: jz4780: silence log flood on txabrt
Message-ID: <20200212145356.GB2492@ninjato>
References: <cover.1581457290.git.hns@goldelico.com>
 <7facef52af9cff6ebe26ff321a7fd4f1ac640f74.1581457290.git.hns@goldelico.com>
 <20200212094628.GB1143@ninjato>
 <213C52CC-E5DC-4641-BE68-3D5C4FEA1FB5@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <213C52CC-E5DC-4641-BE68-3D5C4FEA1FB5@goldelico.com>
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
Content-Type: multipart/mixed; boundary="===============0437951367=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0437951367==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> > Sorry, normally I don't do counter patches. Yet, this time I realized
> > that it would be faster to actually do what I envisioned than to
> > describe it in words. I hope you don't feel offended.
>=20
> No problem. I had thought a little about that myself, but did not
> dare to solve more than my problem...

Glad you like it. Well, it still kinda solves your problem only, because
there are still too many dev_err in there, but I think this is good
enough for now.

> > Obviously, I can't test, does it work for you?
>=20
> Yes,it works.

Good!

> Do you want to push your patch yourself, or should I add it to my
> patch series and resubmit in a v2?

I'll apply the patch to my tree directly as a bugfix for 5.6. You can
drop the I2C list from V2 then.

Thanks and kind regards,

   Wolfram


--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5EEYQACgkQFA3kzBSg
Kbb9XhAAqP9HZ9sgfvFlro1cC/6GvPfKJbDAtFE8FbuoeDBZeVm6Ubz66bi9yjMo
Mj3dyLmzs9vOdU2ARd8USTEo8IqxcvAGWbfX+Elg+AANGAihqddAHjrLdzoXFzPl
Knd/hRKeecprbvjFUTjPwXg4HXoT7QJY/MQ8QvKFW7OptUe3gsBtAbZ5z4lSRdZJ
TUanP+6B3DPE9o8yiA0yWOb9qalk2FCVIrj3rL/wD2i39HCo3//Yw7ljC0cmv+lA
EkVuO2wqQWJELMBs5w4V59pfdyutOL3g4nW+oxRIK7Oq4+ombeY/XIycT6WpAXii
RaclfGk4w/x6MkeLWLKCTckDnBvAA4Mj3+5Xju676ri/JXeFEThrKV62sfiDrhRj
sjfR2n/RPEPWGRxyiXeqZnPX/Nq1LsnPLweohSHg3BbEjwuQYh/FCvFIIdRGvqS6
8F2I78T4PqZvWoQMPOHBtcuwGPQ12d3SbJHAb0Pz/nRAvAuG7aoSbrGwHmgUM6Fz
e+HXwukQIcYgDCJPr4i/6ILuaZ0pWznuxdT+cpcp0TrU69WShw2oxzHK1ORY4N4k
c4oVizAg4qRJhN4B+keV8Tyzt50NQQLtIq+/HeJHYFtQdrELKNEccCGp9PNUSyBk
MaYoqb+2G/i2eF+aGzfb8ntgXAWPneoXBvSP8BofXW8Zco7A1lQ=
=QUM5
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--

--===============0437951367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0437951367==--
