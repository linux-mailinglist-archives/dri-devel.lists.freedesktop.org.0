Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC13223AE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 02:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55186E220;
	Tue, 23 Feb 2021 01:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB696E220
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 01:27:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E53D64E57;
 Tue, 23 Feb 2021 01:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614043620;
 bh=+jNCruc+MkACHldsssuUZj1pB5jnc3ckCdEhn63aZ3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCEbCJ1nJRIcMhV6qGtieEkrJRXyo6qpWJEqetyNU8mP5Jc4ErI09EYGq4fhMtmKH
 e0FxPfE6asbauVfZ9+1UM1DWzJ74gTNHU31AKh8c4Sl8Z6gir2HzfOcNgBiWamoP/L
 M/do1p+yoilcZtwY0asU0u0fQLhjtkfqiRTLNgqlL0NIh9LEjmnBgJzXvJeKAiokoo
 EytYoy8OLcp5Ty/ZSlwErxv9blNXfbMGUH4OIt1Ryf8tMpleWWj/q/jmF5SL87Ahhw
 vj4Y/oFpwohenyZuh7yjzld56y4gVcf30KNB8twNaB1gg57HoLfTY7ARQCgwXgPr5X
 pQcFTm5SrcyDQ==
Received: by earth.universe (Postfix, from userid 1000)
 id 691493C0C96; Tue, 23 Feb 2021 02:26:57 +0100 (CET)
Date: Tue, 23 Feb 2021 02:26:57 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net> <YDQhgkftoW4J9AtY@piout.net>
MIME-Version: 1.0
In-Reply-To: <YDQhgkftoW4J9AtY@piout.net>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1034290445=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1034290445==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vkwv4tifbmgtzlgu"
Content-Disposition: inline


--vkwv4tifbmgtzlgu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> > > the clock is disabled and all i.MX6 functionality depending on
> > > the 32 KHz clock has undefined behaviour. On systems using hardware
> > > watchdog it seems to likely trigger a lot earlier than configured.
> > >=20
> > > The proper solution would be to describe this dependency in DT,
> > > but that will result in a deadlock. The kernel will see, that
> > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > the kernel's perspective this is a chicken-and-egg problem.
> > >=20
> >=20
> > Reading the previous paragraph, I was going to suggest describing the
> > dependency and wondering whether this would cause a circular dependency.
> > I guess this will keep being an issue for clocks on an I2C or SPI bus...

Yes, it is a circular dependency on this particular system on
module. It only works because the RTC enables the clock by
default. The i.MX6 CKIL is expected to be always enabled.

> > > Technically everything is fine by not touching anything, since
> > > the RTC clock correctly enables the clock on reset (i.e. on
> > > battery backup power loss) and also the bootloader enables it
> > > in case a kernel without this support has been booted.
> > >=20
> > > The 'protected-clocks' property is already in use for some clocks
> > > that may not be touched because of firmware limitations and is
> > > described in Documentation/devicetree/bindings/clock/clock-bindings.t=
xt.
> > >=20
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>=20
> Or maybe you expected me to apply the patch, how are the following
> patches dependent on this one?

The last patch, which introduces a new board has a runtime
dependency on this patch. Without this feature the board
goes into a reboot loop because its bootloader enables the
i.MX6 watchdog and without the CKIL its timing is messed up.

But it's a pure runtime dependency for a new board, so it should
be fine to merge this via your tree. It basically means the board
is only working once your tree and arm tree have been merged,
which seems ok from my POV.

-- Sebastian

--vkwv4tifbmgtzlgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmA0WdQACgkQ2O7X88g7
+prAbBAAkf1j4TWyAUwNGCEKZRb6+YySPrlQpkb3EBCE0zV+l99HVYKLfAz5CwCH
mqVf4GgzAE64+byU2NfmMcXiLikzUlcVR0gN572ED/a5ZEyRkqm7euVnV7jzL6eG
olAlqpcEy7d6y5R0pHDytFbPAN7C5LN8aTl6zcuroH9QcuFcezQpEd+01PkQMSNJ
8gT6dXPdeKoy8AqTcwVBel4CS3oQc/mSQ3fuMBa6+UTz90lznin2vyl4arHMd+tv
LLQvlrn6T2X+rgQ3UNyfEsuSo4WFIdreoWIobQgUmZIhXjno04PTNghc3mhHpHUE
oL6DMhyB474mdGS3cFIgDnTwFQFKaLOKQiJDcgTBDU497SsTZxOf/DDvU6MEtkzT
VeCOmfm9xjYxNa0yALMic/nSibePV/bdXiak/njl3KOd5ElQ9RcvlsKMAlK8k1YM
kKr47aye0+n4hivy1vZR2Kh+wx3BrsGnsYF9gJVUqCkuwA1X58PU6Iq9QVxxMDe2
SQ62Jz5Y/kg+c+eFas4AeT1NRFZhEvcfni8pHdF2TketdpM4VLQCAdYqkHhpz4Wx
qmv9E/FU7qly5kOTjcIKhwk7MS4deNZaQoQt/MUs1LN0PBv162jneWsqjmRgLyMH
cxEOJN/MZVgB5gKG+U5wmHksMAjIfLi3OOC668MhSh2loA48XvE=
=Hawo
-----END PGP SIGNATURE-----

--vkwv4tifbmgtzlgu--

--===============1034290445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1034290445==--
