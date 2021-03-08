Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E3D33104E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 15:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDB489C59;
	Mon,  8 Mar 2021 14:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E321689C3F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 14:04:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8206F64EBC;
 Mon,  8 Mar 2021 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615212240;
 bh=E1p7ETbjo4cfMPaI3vXRnRJoJxKJzun0W2n67A7eow4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QtR5QVRpLfOz0bim/vdh8qduvyb+P64c5oDctr1Kc1SbnxPiGtubTojmJQbxlNC90
 H9k3ur/telJzc8ORujkgR/jBPqC1JH+5gr6Fp1J4VSmJWF/lP9NxFa8Eo7xTt8WaBh
 Qs1VqnP1n9pCkjh4GkMZOh7thjL78Ti6e2EyC+3lWHpsGqy62xgN7AVkBkLdVcESxl
 vfQ6ljG6XZAWXMV/1oItTkkb6o2HMZaL+Bp+Nhkj6coKuQ3NtQnGgmIlQm/hb/L0tP
 lhwDn9aLAU4T67KRUQv8+eCNfZO9zKNLD4+NosvHIlELW9XqKoqr62yJDGM4uf5L1Y
 KNFuA02Mf8PKQ==
Received: by earth.universe (Postfix, from userid 1000)
 id 742BE3C0C95; Mon,  8 Mar 2021 15:03:58 +0100 (CET)
Date: Mon, 8 Mar 2021 15:03:58 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Message-ID: <20210308140358.diolcpbaq7gow3y4@earth.universe>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-2-sebastian.reichel@collabora.com>
 <YDQgLTPE0E+/1Cwv@piout.net> <YDQhgkftoW4J9AtY@piout.net>
 <20210223012657.bbp5u65nw4tpcjgd@earth.universe>
 <20210306195645.GA1112592@robh.at.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210306195645.GA1112592@robh.at.kernel.org>
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1858366524=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1858366524==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tz3no5iwp6fmwznd"
Content-Disposition: inline


--tz3no5iwp6fmwznd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 06, 2021 at 11:56:45AM -0800, Rob Herring wrote:
> On Tue, Feb 23, 2021 at 02:26:57AM +0100, Sebastian Reichel wrote:
> > On Mon, Feb 22, 2021 at 10:26:26PM +0100, Alexandre Belloni wrote:
> > > On 22/02/2021 22:20:47+0100, Alexandre Belloni wrote:
> > > > On 22/02/2021 18:12:42+0100, Sebastian Reichel wrote:
> > > > > Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> > > > > modules SQW clock output defaults to 32768 Hz. This behaviour is
> > > > > used to provide the i.MX6 CKIL clock. Once the RTC driver is prob=
ed,
> > > > > the clock is disabled and all i.MX6 functionality depending on
> > > > > the 32 KHz clock has undefined behaviour. On systems using hardwa=
re
> > > > > watchdog it seems to likely trigger a lot earlier than configured.
> > > > >=20
> > > > > The proper solution would be to describe this dependency in DT,
> > > > > but that will result in a deadlock. The kernel will see, that
> > > > > i.MX6 system clock needs the RTC clock and do probe deferral.
> > > > > But the i.MX6 I2C module never becomes usable without the i.MX6
> > > > > CKIL clock and thus the RTC's clock will not be probed. So from
> > > > > the kernel's perspective this is a chicken-and-egg problem.
> > > > >=20
> > > >=20
> > > > Reading the previous paragraph, I was going to suggest describing t=
he
> > > > dependency and wondering whether this would cause a circular depend=
ency.
> > > > I guess this will keep being an issue for clocks on an I2C or SPI b=
us...
> >=20
> > Yes, it is a circular dependency on this particular system on
> > module. It only works because the RTC enables the clock by
> > default. The i.MX6 CKIL is expected to be always enabled.
>=20
> I think you should describe the circular clocking and then provide a way=
=20
> to break the dependency.

This is very much not trivial. The clock is required during early
initialization of the i.MX. At this point we are far from probing
I2C drivers and without the I2C driver the clock is not registered.
The current i.MX code expects the system clocks to be fixed clocks,
since they must be enabled before any code is executed (incl.
bootloader) and must never be disabled. From a HW design point of
view it does not make sense to have a SW controllable clock for it,
since it just adds extra cost. I believe for QMX6 it is only SW
controllable, because that avoids the need for an extra crystal.

So how is the clock framework supposed to know, that it can ignore
the clock during registration? I see the following options:

1. My solution is the simplest one. Keep i.MX clock code the same
   (it assumes a fixed-clock being used for CKIL) and avoid
   registering RTC clock. This basically means the RTC is considered
   to be a fixed-clock on this system, which is what the HW designers
   seemed to have in mind (vendor kernel for the QMX6 is old enough
   (4.9.x) to not to have CLK feature in the RTC driver. Vendor
   U-Boot also does not touch the RTC. Booting mainline kernel once
   bricks QMX6 boards until RTC battery is removed, so one could
   actually argue addition of the CLK feature in 1373e77b4f10 (4.13)
   is a regression). Currently Qualcomm device uses "protected-clocks"
   for FW controlled clocks where Linux would crash the system by
   trying to access them. IMHO the RTC is similar, since disabling
   or modifying its frequency on QMX6 results in undefined behaviour
   and possibly system crash.

2. Make i.MX clock code use the RTC as CKIL clock provider, but
   ignore it somehow. I see three sub-options:

2.1. Add a property 'boot-enabled' to the RTC node, so that the
     clock framework is aware of clock being enabled. This can
     be used to satisfy clock dependencies somehow.

2.2. The RTC device is not probed without I2C bus, but the driver
     could also register a fake clock purely based on DT
     information by adding some early init hook and take over
     the clock once the I2C part is being probed. I think this
     is a bad idea regarding maintainability of the driver.
     Also for systems not using the RTC clock, the early clock
     registration is basically wrong: If the kernel disables
     the RTC it will stay disabled across boots if the RTC has
     a backup battery. Basically we cannot imply anything from
     the RTC compatible value alone.

2.3 The i.MX core code could request CKIL with some flag, that
    it's fine to have an unresolvable clock and just expect it
    to be boot-enabled. The rationale would be, that CKIL must
    be always-enabled.

> It's a somewhat common issue.

It is? This only works, because one can treat the RTC's clock
output like a fixed clock by not messing around with it.

-- Sebastian

--tz3no5iwp6fmwznd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBGLsQACgkQ2O7X88g7
+ppYag//VqCs0DzfkeAZpa06OpqMBRfRplqZWf6IlhyET4qXikZHjob95UJcdPuT
EQ26LP3hKVnN2BE36R2sVifMQ5LixPbWsb/iFw21kIDFdbjhagyI6sotvpd/96N9
hPEbc8ifVNAr/407a/sW5OzC9seCqW9DO9Xt35IPRyIOPZHj9eUBa1hS+1stC0Q1
2EqtwU5dkxY/aQDT/50riSszhggjhMS5ITmKXDzQe0dQizYIPIixn1+v6B7CAt8k
1sWIdZiyt3PPd4fm5F8dvtEirkmG5Wjkv9UQVdi+30RHuJfK5ONIISl2gREbjPL6
vQSHEfqz6iQYWiwZN4t21opDnloT+wh5ljNghlpnIyeAPcQSfiWN89qUZ3A639+I
0VxlHLxs0EfLWdNXVxnUW1zXO6EVjhGB8KnSPQic2EFcJNrId8yejK0e6GBsZ6fc
i6mIonybZnSy7rwnkapkfsJ77CA/Uq3Jvb9PI7WgxA/PljLejUue5Plce2b/iJpZ
Bus/MtIloeZzBqCTFTa8gCArgYxPB06ROpCM/gvjqmx1/XGVervqJXdChT7Wbk+8
0KQEkXoz+POcUJemu0OUYsvOW5jTNlkotqrweY4Qdyx/0/VuA1HXEEQQ6J3NBf1x
qI2tYZkqjU5R2rnSbhvcnxMPnfwL3MwL9gm7iTvf6wUvEz8iP6c=
=vlxG
-----END PGP SIGNATURE-----

--tz3no5iwp6fmwznd--

--===============1858366524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1858366524==--
