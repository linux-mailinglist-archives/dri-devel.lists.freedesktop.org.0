Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15B16B7BC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 03:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4896E0D7;
	Tue, 25 Feb 2020 02:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8E36E0D7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 02:28:24 +0000 (UTC)
Received: from earth.universe (dyndsl-095-033-168-151.ewe-ip-backbone.de
 [95.33.168.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5ECF9222D9;
 Tue, 25 Feb 2020 02:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582597704;
 bh=+QLOPBn1fNUFeSisGKHT+mald8sbj79xqNLlx7YsXnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hUoFuwX7F7GwmGWEkbibtmboAG/zs1AnbBbNuDA8VqBT8wFEZ3jUt2nUiX6ZGPZS9
 fKg6jjYKj0nIg1ShyztvcjK/mTLqU4m1sbRSUTfSSoBEIV+YVKd92rY8yq2mZ2irPy
 znvt9+0txIpqc0eyneX7j7LLb3J5doHUm5i02xWk=
Received: by earth.universe (Postfix, from userid 1000)
 id 41EF03C0C83; Tue, 25 Feb 2020 03:28:22 +0100 (CET)
Date: Tue, 25 Feb 2020 03:28:22 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200225022822.wh7omykthv7skojy@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20200225001011.GF37466@atomide.com>
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1087128771=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1087128771==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fxci4c2chjabbjv"
Content-Disposition: inline


--2fxci4c2chjabbjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 24, 2020 at 04:10:11PM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sebastian.reichel@collabora.com> [200224 23:22]:
> > This updates the existing omapdrm DSI code, so that it uses
> > common drm_mipi_dsi API and drm_panel.
> >=20
> > The patchset has been tested with Droid 4 using Linux console, X.org and
> > Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> > and removes the last custom panel driver, so quite a few cleanups on the
> > omapdrm codebase were possible.
> >=20
> > [0] [PATCH v7 00/54] drm/omap: Replace custom display drivers with drm_=
bridge and drm_panel
> >     https://lore.kernel.org/dri-devel/20200222150106.22919-1-laurent.pi=
nchart@ideasonboard.com/
> >     git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
> >=20
> > I pushed this patchset into the following branch:
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git omapdr=
m/bridge/devel-with-dsi
>=20
> I gave your omapdrm/bridge/devel-with-dsi branch a quirk test
> on droid4, but get the following oops with mostly modular
> omap2_defconfig.

:( I was testing with a non-modular kernel, since that gives me a
much easier testing workflow. Guess I need to spend some time to get
a good setup for testing modular kernel with Droid4.

> BTW, I think there's also some refcount issue in general where
> the omapdrm related modules cannot be unloaded any longer?

I wouldn't be too surprised. The dependencies are quite interesting
at the moment with omapdss registering omapdrm and then omapdrm
registers the drm_device, which references the encoders from
omapdss. I think this is something to look at once Laurent's and
my branch have been merged to avoid increasing the complexity.
Technically it should be possible to link everything into one
module.

> 8< -------------------------
> Internal error: Oops: 805 [#1] PREEMPT SMP ARM
> Modules linked in: omapdss(+) omapdss_base drm_kms_helper syscopyarea sys=
fillrect sysimgblt fb_sys_fops drm drm_panel_ors
> CPU: 0 PID: 811 Comm: modprobe Not tainted 5.6.0-rc2-00376-g163017c12d62a=
 #1926
> Hardware name: Generic OMAP4 (Flattened Device Tree)
> PC is at drm_bridge_remove+0x24/0x40 [drm]
> LR is at drm_bridge_remove+0x14/0x40 [drm]
> pc : [<bf2a0cb4>]    lr : [<bf2a0ca4>]    psr: 60000013
> sp : edc6fc88  ip : eda3a100  fp : bf38a5b4
> r10: bf38c7d0  r9 : edc164b8  r8 : edc1606c
> r7 : edc1647c  r6 : edc93010  r5 : bf2dc428  r4 : edc164b8
> r3 : edc164fc  r2 : 00000000  r1 : 00000000  r0 : bf2dc428
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: adc7404a  DAC: 00000051
> Process modprobe (pid: 811, stack limit =3D 0x(ptrval))
> Stack: (0xedc6fc88 to 0xedc70000)
> fc80:                   edc16040 fffffdfb edc93010 bf37dfd0 00000080 edc2=
eb00
> fca0: edc16040 edc93010 edc93010 00000000 bf392178 00000000 00000000 bf39=
2178
> fcc0: 0000001e c0624424 edc93010 c0efafa0 c0efafa4 00000000 00000000 c062=
22e4
> fce0: edc93010 bf392178 bf392178 c0622880 c06243a0 c06243dc c0e93210 c062=
25cc
> fd00: bf38c450 a0000013 bf38a5b4 edc93010 00000000 bf392178 c0622880 c062=
43a0
> fd20: c06243dc c0622878 00000000 bf392178 edc93010 c06228d8 edc94fb4 edc6=
e000
> fd40: bf392178 c062069c edc50eb8 ee8dae58 edc94fb4 d759a07d ee8dae6c bf39=
2178
> fd60: edc50e80 c0e93210 00000000 c0621618 bf38f0c0 bf3922c0 00000006 bf39=
2178
> fd80: bf3922c0 00000006 c0623db0 c062344c 00000002 bf3922c0 00000006 c062=
44fc
> fda0: bf38a5b0 bf38a5a8 000be666 c0ec0540 bf39a000 00000000 bf392308 0000=
0002
> fdc0: edc2c300 c01dc694 edc6ff30 c0102fec c0ebbcf4 00000000 00000cc0 c0d7=
5a70
> fde0: edc2c2c0 c02b4538 c0d75a70 a0000013 a0000013 00000008 c01de5bc 0000=
0002
> fe00: 00000001 c01dc694 edc6ff30 d759a07d edbe7400 bf3922c0 00000002 d759=
a07d
> fe20: bf392308 bf3922c0 edbe7400 edc2c2c0 bf392308 c01de5f8 00000002 edc2=
c2c0
> fe40: bf3922c0 00000002 edc2c2c0 c01e0b1c bf3922cc 00007fff bf3922c0 c01d=
d34c
> fe60: bf3a44ee 004c1a8f bf3922c0 bf3923d4 bf3924b8 c0a05fa8 00000000 bf38=
d075
> fe80: 00000001 00000000 c0bddd78 c0bc76d8 bf38a03c 00000002 00000000 0000=
0000
> fea0: 00000000 00000000 6e72656b 00006c65 00000000 00000000 00000000 0000=
0000
> fec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000
> fee0: 00000000 d759a07d 7fffffff edc6e000 00000000 00000003 004c1a8f 7fff=
ffff
> ff00: 00000000 0000017b 004d56a0 c01e1050 7fffffff 00000000 00000003 c093=
c724
> ff20: 00000002 f1370000 000e3464 00000000 f138b0c6 f138f3c0 f1370000 000e=
3464
> ff40: f1452a3c f14527a4 f1425e58 00022000 00025680 0000a084 00027a0b 0000=
0000
> ff60: 00000000 00000000 0000a074 0000003e 0000003f 00000021 00000025 0000=
0018
> ff80: 00000000 d759a07d 004dcb80 64a54c46 b6f6a510 0000017b 0000017b c010=
1204
> ffa0: edc6e000 c0101000 64a54c46 b6f6a510 00000003 004c1a8f 00000000 004d=
cb80
> ffc0: 64a54c46 b6f6a510 0000017b 0000017b 004dcb80 00000001 00000000 004d=
56a0
> ffe0: 004dcb80 bea7ba90 0043d1a9 b6f1d0b8 60000030 00000003 00000000 0000=
0000
> [<bf2a0cb4>] (drm_bridge_remove [drm]) from [<bf37dfd0>] (dsi_probe+0x3ac=
/0x55c [omapdss])
> [<bf37dfd0>] (dsi_probe [omapdss]) from [<c0624424>] (platform_drv_probe+=
0x48/0x98)
> [<c0624424>] (platform_drv_probe) from [<c06222e4>] (really_probe+0x1dc/0=
x340)
> [<c06222e4>] (really_probe) from [<c06225cc>] (driver_probe_device+0x5c/0=
x160)
> [<c06225cc>] (driver_probe_device) from [<c0622878>] (device_driver_attac=
h+0x58/0x60)
> [<c0622878>] (device_driver_attach) from [<c06228d8>] (__driver_attach+0x=
58/0xcc)
> [<c06228d8>] (__driver_attach) from [<c062069c>] (bus_for_each_dev+0x78/0=
xb8)
> [<c062069c>] (bus_for_each_dev) from [<c0621618>] (bus_add_driver+0xf0/0x=
1d4)
> [<c0621618>] (bus_add_driver) from [<c062344c>] (driver_register+0x74/0x1=
08)
> [<c062344c>] (driver_register) from [<c06244fc>] (__platform_register_dri=
vers+0x54/0xd0)
> [<c06244fc>] (__platform_register_drivers) from [<c0102fec>] (do_one_init=
call+0x44/0x2a8)
> [<c0102fec>] (do_one_initcall) from [<c01de5f8>] (do_init_module+0x5c/0x2=
34)
> [<c01de5f8>] (do_init_module) from [<c01e0b1c>] (load_module+0x22c4/0x258=
0)
> [<c01e0b1c>] (load_module) from [<c01e1050>] (sys_finit_module+0xc4/0xe0)
> [<c01e1050>] (sys_finit_module) from [<c0101000>] (ret_fast_syscall+0x0/0=
x54)
> Exception stack(0xedc6ffa8 to 0xedc6fff0)
> ffa0:                   64a54c46 b6f6a510 00000003 004c1a8f 00000000 004d=
cb80
> ffc0: 64a54c46 b6f6a510 0000017b 0000017b 004dcb80 00000001 00000000 004d=
56a0
> ffe0: 004dcb80 bea7ba90 0043d1a9 b6f1d0b8
> Code: e5942048 e5941044 e2843044 e1a00005 (e5812004)
> ---[ end trace 6213ab3cbabf9f59 ]---

oops, looks like dsi_bridge_init() is missing "drm_bridge_add(&dsi->bridge)=
;"
before returning. Now I wonder why it is working for me without the
bridge being added :) I will send out an updated patch for this tomorrow.

-- Sebastian

--2fxci4c2chjabbjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5Uhj8ACgkQ2O7X88g7
+ppPDxAAgRbpv4ZgqbI9/uoytQbdbvBFgwaV0LygZgsKG6fahgLK1+eUE2FMqWm+
4OCXsrl4OovKhlCovh3F+FlGw+8K4eel7Fokahj9IUEVKV1xltQFAeV2aB2S0BDT
DfKkaLb7RAwcwuBvvcFAHfG4LzrTFRrNarF+OQe4BSE6pEDbBKy9pUFyu8jyLKV9
TqKrhad9WYdu6+7acJqSK4StaL11UGT4NcZitQPaLvufbd/AgOac74LIeUZqwbu9
xolodBuXitUBfR/eb/p6YQpJIE/ZtvBUjM1iA0mESGmVYUlITvTZ4wK+df9VWOAm
ljWm5xDyqKq7AfF1MjnRmlbQcaXcwKsEFnXP5Ufv8NwYG7X8+7OLIuJz3hrrA4qg
3e98fLR2L51gEIXnerDiqsewqOWshfy1FESfw/RMAPuSnl/ahCdVvyrThSAxucQ4
bZq0CS7WYRoI7ztv2uTkcfCNwX6TPLuPDeBu3ud+B6ThhVphdZnnq+gIbDFnnWqG
qTXFUNCvAdUT3RJu/PM5zzmnIJs3gHR+u94JDZlwrRBO3TD+Agcs6iAtiG5aLs7z
6IEr0VhmQ+RqSzy8uB3SYRiGHYx1pRNj0h6VZUyx0m70uvRPQn3eEWklCgYGN1EI
GHBQkaZ8jTOWSyjAAmwZR/mKYmRxX/iNi8Bbx/cGeB57v9Z9NwQ=
=1qcA
-----END PGP SIGNATURE-----

--2fxci4c2chjabbjv--

--===============1087128771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1087128771==--
