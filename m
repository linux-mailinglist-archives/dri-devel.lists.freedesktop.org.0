Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F8171220
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA9B6EC1F;
	Thu, 27 Feb 2020 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725346E9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 14:57:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E490AAC5C;
 Wed, 26 Feb 2020 14:57:56 +0000 (UTC)
Message-ID: <f34f037ebb9219c34480814433a277054c345690.camel@suse.de>
Subject: Re: [PATCH 10/89] clk: bcm: rpi: Remove global pllb_arm clock pointer
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 26 Feb 2020 15:57:53 +0100
In-Reply-To: <20200226142617.mvis6olfzakiwqcc@gilmour.lan>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <3876f732b3fec2059270678d464d27b7d3a0414b.1582533919.git-series.maxime@cerno.tech>
 <52aebb76952df530f93e9de539124ddf1b825876.camel@suse.de>
 <20200226142617.mvis6olfzakiwqcc@gilmour.lan>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0907721700=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0907721700==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-H7D2q/McolpIoggtEKhp"


--=-H7D2q/McolpIoggtEKhp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-26 at 15:26 +0100, Maxime Ripard wrote:
> Hi Nicolas,
>=20
> On Tue, Feb 25, 2020 at 05:13:33PM +0100, Nicolas Saenz Julienne wrote:
> > On Mon, 2020-02-24 at 10:06 +0100, Maxime Ripard wrote:
> > > The pllb_arm clk_hw pointer in the raspberry_clk structure isn't used
> > > anywhere but in the raspberrypi_register_pllb_arm.
> > >=20
> > > Let's remove it, this will make our lives easier in future patches.
> > >=20
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: linux-clk@vger.kernel.org
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>=20
> I guess you meant Acked or Reviewed-by?

Yes sorry, I ran the wrong macro in vim.

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!
Nicolas


--=-H7D2q/McolpIoggtEKhp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5Wh3EACgkQlfZmHno8
x/5dXwf/bKHxAxeQ4QoZjBlowsDSKby25i/UiGoQRjMihV8lAF5kvgszeIQN06d3
QFyxNv6+5IGxrr59IVdsYrnNV2dEVmKjg+6LZuVRPNCVRvEFdfRiTpukk3uxgFlX
sLaq8Lka4a64P4aoKJmqlge6JgXxhURwb/sUC9BBv+InbDws6+XxkDCXG0UmH8rG
sTsmoW8/gUiUJ+koBCxtipKbgzjzLim2LdWX2kUrdMZCBAP/Rxxp1bHCiHaGYRh8
pUvVxJ/IpJ0KC0Ef7QYlyk3/hnnPHPtcwo1z5NfXOsgTBLFXSv9rq6Jrqk0OJkga
LB3ZGFODiroFr+Q15H+sdaU4BV+KLw==
=93WR
-----END PGP SIGNATURE-----

--=-H7D2q/McolpIoggtEKhp--


--===============0907721700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0907721700==--

