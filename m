Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B177280DCC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A9A6E247;
	Fri,  2 Oct 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8A6E175
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 09:22:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6073FAD49;
 Thu,  1 Oct 2020 09:22:06 +0000 (UTC)
Message-ID: <eb0c0edaf22404fd69440a85bb78397a14d49ddc.camel@suse.de>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Nathan Chancellor <natechancellor@gmail.com>, Maxime Ripard
 <maxime@cerno.tech>
Date: Thu, 01 Oct 2020 11:22:03 +0200
In-Reply-To: <20200930163823.GA237050@ubuntu-m3-large-x86>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Oct 2020 07:02:50 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2017177878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2017177878==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xeOzVywA1Zb9Rs2smcOD"


--=-xeOzVywA1Zb9Rs2smcOD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-09-30 at 09:38 -0700, Nathan Chancellor wrote:
> On Wed, Sep 30, 2020 at 04:07:58PM +0200, Maxime Ripard wrote:
> > Hi Nathan,
> >=20
> > On Tue, Sep 29, 2020 at 03:15:26PM -0700, Nathan Chancellor wrote:
> > > On Thu, Sep 03, 2020 at 10:01:52AM +0200, Maxime Ripard wrote:
> > > > Now that all the drivers have been adjusted for it, let's bring in =
the
> > > > necessary device tree changes.
> > > >=20
> > > > The VEC and PV3 are left out for now, since it will require a more =
specific
> > > > clock setup.
> > > >=20
> > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> > > > Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > > > Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > Apologies if this has already been reported or have a solution but th=
is
> > > patch (and presumably series) breaks output to the serial console aft=
er
> > > a certain point during init. On Raspbian, I see systemd startup messa=
ges
> > > then the output just turns into complete garbage. It looks like this
> > > patch is merged first in linux-next, which is why my bisect fell on t=
he
> > > DRM merge. I am happy to provide whatever information could be helpfu=
l
> > > for debugging this. I am on the latest version of the firmware
> > > (currently 26620cc9a63c6cb9965374d509479b4ee2c30241).
> >=20
> > Unfortunately, the miniUART is in the same clock tree than the core
> > clock and will thus have those kind of issues when the core clock is
> > changed (which is also something that one should expect when using the
> > DRM or other drivers).
> >=20
> > The only real workaround there would be to switch to one of the PL011
> > UARTs. I guess we can also somehow make the UART react to the core cloc=
k
> > frequency changes, but that's going to require some effort
> >=20
> > Maxime
>=20
> Ack, thank you for the reply! There does not really seem to be a whole
> ton of documentation around using one of the other PL011 UARTs so for
> now, I will just revert this commit locally.

Nathan, a less intrusive solution would be to add 'core_freq_min=3D500' int=
o your
config.txt.

Funnily enough core_freq=3D500 doesn't seem to work in that regard. It migh=
t be
related with what Maxime is commenting.

Regards,
Nicolas


--=-xeOzVywA1Zb9Rs2smcOD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl91n7sACgkQlfZmHno8
x/6QOQf/cx8IX0E/La/BOt0djC9PTcTaBmAMhBO2AfyXGlNq5oGKHYiP6n5O7ISG
f7xgS02IcmsV5D4IdU/b16t9/6MwrFRTqf1OY/ba15HU0kgsLQMRNa3VA7GSbDUo
cesVEbufcrEm7Xb92OfM/2aC4sVjnaGCA18RzyVEpD2SBvtpjqUoZtvH0ecscizT
O41ZlDVLyWZnEklG1e98RhBJWghm2H6h7C+0cI6zxNSeSOh/JUx9BPYK5RBpGqCV
BMN+zbPH9JP19kk+64U2+mvJSxCE77FryfY3LA2EQ9tCbZZdF/4+7mkc3hbpP0B5
rWZrlZMSnjYPX6sFfsv9edR2V1XrcQ==
=Ivvl
-----END PGP SIGNATURE-----

--=-xeOzVywA1Zb9Rs2smcOD--


--===============2017177878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2017177878==--

