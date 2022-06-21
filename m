Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72686553BEB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 22:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180ED10E29B;
	Tue, 21 Jun 2022 20:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B05710E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 20:50:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3koX-0003Nu-CG; Tue, 21 Jun 2022 22:49:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3koE-001tq7-4E; Tue, 21 Jun 2022 22:49:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3koE-000HIi-Od; Tue, 21 Jun 2022 22:49:14 +0200
Date: Tue, 21 Jun 2022 22:49:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jon Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
Message-ID: <20220621204914.byokkrxiznvod7vq@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uzxszqlixhftbuhf"
Content-Disposition: inline
In-Reply-To: <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Tomislav Denis <tomislav.denis@avl.com>, dri-devel@lists.freedesktop.org,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-rtc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 =?utf-8?B?QW5kcsOp?= Gustavo Nakagomi Lopez <andregnl@usp.br>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Russell King <linux@armlinux.org.uk>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, linux-iio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <caihuoqing@baidu.com>, linux-mips@vger.kernel.org,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-watchdog@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 kernel@pengutronix.de, Lars Povlsen <lars.povlsen@microchip.com>,
 linux-hwmon@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, UNGLinuxDriver@microchip.com,
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 linux-crypto@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uzxszqlixhftbuhf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 08:57:00PM +0100, Jon Hunter wrote:
> Some of our Tegra boards are not booting with the current -next and
> bisect is pointing to this commit. Looking at the boot log I am
> seeing the following panic ...
>=20
> [    2.097048] 8<--- cut here ---
> [    2.097053] Unable to handle kernel paging request at virtual address =
c216c810
> [    2.097060] [c216c810] *pgd=3D0201141e(bad)
> [    2.097079] Internal error: Oops: 8000000d [#1] SMP ARM
> [    2.097088] Modules linked in:
> [    2.097097] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc3-next-=
20220621-g34d1d36073ea #1
> [    2.097107] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    2.097113] PC is at 0xc216c810
> [    2.097123] LR is at devm_clk_release+0x18/0x24
> [    2.097150] pc : [<c216c810>]    lr : [<c088cb04>]    psr: a0000013
> [    2.097155] sp : f080dde8  ip : 000006cf  fp : c18d4854
> [    2.097161] r10: c1501850  r9 : c1a04d10  r8 : c1c4efa0
> [    2.097166] r7 : c216c810  r6 : f080de1c  r5 : c2737680  r4 : c26a9680
> [    2.097172] r3 : c216c810  r2 : 00000000  r1 : c2737840  r0 : c2082840
> [    2.097179] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segme=
nt none
> [    2.097187] Control: 10c5387d  Table: 0020404a  DAC: 00000051
> [    2.097191] Register r0 information: slab kmalloc-192 start c2082840 p=
ointer offset 0 size 192
> [    2.097216] Register r1 information: slab kmalloc-128 start c2737800 p=
ointer offset 64 size 128
> [    2.097236] Register r2 information: NULL pointer
> [    2.097244] Register r3 information: slab kmalloc-1k start c216c800 po=
inter offset 16 size 1024
> [    2.097263] Register r4 information: slab kmalloc-64 start c26a9680 po=
inter offset 0 size 64
> [    2.097282] Register r5 information: slab kmalloc-128 start c2737680 p=
ointer offset 0 size 128
> [    2.097301] Register r6 information: 2-page vmalloc region starting at=
 0xf080c000 allocated at kernel_clone+0xb4/0x3e8
> [    2.097321] Register r7 information: slab kmalloc-1k start c216c800 po=
inter offset 16 size 1024
> [    2.097341] Register r8 information: non-slab/vmalloc memory
> [    2.097348] Register r9 information: non-slab/vmalloc memory
> [    2.097355] Register r10 information: non-slab/vmalloc memory
> [    2.097362] Register r11 information: non-slab/vmalloc memory
> [    2.097369] Register r12 information: non-paged memory
> [    2.097375] Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
> [    2.097384] Stack: (0xf080dde8 to 0xf080e000)
> [    2.097394] dde0:                   c2737800 c0a72d38 c18d4854 c053049=
0 c216c810 f080de1c
> [    2.097404] de00: c2120000 00000005 c216c9c0 80000013 0000017e c0a73d6=
8 00000008 c2629e00
> [    2.097413] de20: c2737880 5640e141 c216c810 c216c810 00000205 c1c09dd=
4 00000000 c27375b8
> [    2.097422] de40: c2091700 c0a6e9a0 c216c810 c0a6f288 c216c810 c1c09dd=
4 c216c810 00000000
> [    2.097430] de60: c27375b8 c0a6f3c0 c1caa8e0 c216c810 c216c810 c0a6f45=
0 00000000 c216c810
> [    2.097439] de80: c1c09dd4 c2120000 c27375b8 c0a6f850 00000000 c1c09dd=
4 c0a6f7c4 c0a6d4c0
> [    2.097447] dea0: 00000000 c2091458 c2286434 5640e141 c1be7f08 c1c09dd=
4 c2737580 c1be7f08
> [    2.097455] dec0: 00000000 c0a6e484 c1615714 c1be7c50 c1c09dd4 c212000=
0 c189a99c 00000000
> [    2.097464] dee0: c2120000 c0a701a0 c1c494e0 c2120000 c189a99c c030214=
4 0000017d c0364438
> [    2.097472] df00: c16da8bc c1626700 00000000 00000006 00000006 c16554c=
8 00000000 c2120000
> [    2.097480] df20: c15105bc c14f9778 c2091700 c20917d9 00000000 5640e14=
1 c1a88930 c16da8bc
> [    2.097488] df40: c1c59000 5640e141 c16da8bc c1c59000 c1953b4c c18d483=
4 00000007 c1801340
> [    2.097497] df60: 00000006 00000006 00000000 c18004dc c2120000 c18004d=
c f080df74 c1a04cc0
> [    2.097505] df80: c106bbf0 00000000 00000000 00000000 00000000 0000000=
0 00000000 c106bc08
> [    2.097513] dfa0: 00000000 c106bbf0 00000000 c03001a8 00000000 0000000=
0 00000000 00000000
> [    2.097520] dfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
> [    2.097528] dfe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0 00000000 00000000
> [    2.097542]  devm_clk_release from release_nodes+0x58/0xc0
> [    2.097575]  release_nodes from devres_release_all+0x7c/0xc0
> [    2.097596]  devres_release_all from device_unbind_cleanup+0xc/0x60
> [    2.097626]  device_unbind_cleanup from really_probe+0x1f4/0x2a8
> [    2.097650]  really_probe from __driver_probe_device+0x84/0xe4
> [    2.097673]  __driver_probe_device from driver_probe_device+0x30/0xd0
> [    2.097696]  driver_probe_device from __driver_attach+0x8c/0xf0
> [    2.097713]  __driver_attach from bus_for_each_dev+0x70/0xb0
> [    2.097729]  bus_for_each_dev from bus_add_driver+0x168/0x1f4
> [    2.097749]  bus_add_driver from driver_register+0x7c/0x118
> [    2.097766]  driver_register from do_one_initcall+0x44/0x1ec
> [    2.097784]  do_one_initcall from kernel_init_freeable+0x1d4/0x224
> [    2.097803]  kernel_init_freeable from kernel_init+0x18/0x12c
> [    2.097820]  kernel_init from ret_from_fork+0x14/0x2c
> [    2.097831] Exception stack(0xf080dfb0 to 0xf080dff8)
> [    2.097839] dfa0:                                     00000000 0000000=
0 00000000 00000000
> [    2.097847] dfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
> [    2.097854] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    2.097862] Code: c2288680 ffffffff 00000000 00000000 (c2288680)
> [    2.097872] ---[ end trace 0000000000000000 ]---
>=20
>=20
> Let me know if you have any thoughts.

Yeah, sorry, there is already a fix at
https://lore.kernel.org/linux-clk/20220620171815.114212-1-u.kleine-koenig@p=
engutronix.de

(Pro tipp: The commit in next has a Link: footer. If you follow the
link, you find the thread that was actually applied (i.e. v9) and where
the fix is also contained.)

@Stephen: It would be a great favour to our testers if you could apply
the fix ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uzxszqlixhftbuhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKyLscACgkQwfwUeK3K
7AnhOwgAoJ7+WVNat5QtQxPAov0GgQ/NeeLpTVS16heM9RAVaRuezJxOr7k7z/AN
DSNd0SEFBPDE8PkdUrAbIY607zkPkKaLrKQFpjhDciHceMDazKEoKdALu/lMM409
sCiY8s2KTYhosNBXTORdQ2ItBXOWazKLe6M+WWiIWu9Sa83Ulagv5CifqiCvUBrc
g1x7kXPbQDMorRwwT+nuQ5Ph03wEef0UMGyS/20yU966XafejCZCkfTALLJWiGzt
NRO6lO+0NlxhEY8ccLGw+Lu3svkIMOX08s829MM0IF3GwWi5ktZmZ/QN291tKRlT
xZbpiGeH4vZPdETbfxbl1w7F+4JFmQ==
=qUR3
-----END PGP SIGNATURE-----

--uzxszqlixhftbuhf--
