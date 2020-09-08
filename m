Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C42627F0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B736E9E6;
	Wed,  9 Sep 2020 07:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2CA6E878
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 16:09:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29CF9ADDB;
 Tue,  8 Sep 2020 16:09:48 +0000 (UTC)
Message-ID: <f3d9a4a95e419b2cd67469b4adba4cfe4da71f7a.camel@suse.de>
Subject: Re: [PATCH v2 1/4] clk: bcm: rpi: Add register to control pixel bvb
 clk
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, eric@anholt.net,
 maxime@cerno.tech,  stefan.wahren@i2se.com, dave.stevenson@raspberrypi.com
Date: Tue, 08 Sep 2020 18:09:44 +0200
In-Reply-To: <20200901040759.29992-2-hoegeun.kwon@samsung.com>
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
 <CGME20200901040851epcas1p28f443c0e819bea756ebf9296491b32da@epcas1p2.samsung.com>
 <20200901040759.29992-2-hoegeun.kwon@samsung.com>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2143731548=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2143731548==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bRnBewXchSGzBuzQX1iH"


--=-bRnBewXchSGzBuzQX1iH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-09-01 at 13:07 +0900, Hoegeun Kwon wrote:
> To use QHD or higher, we need to modify the pixel_bvb_clk value. So
> add register to control this clock.
>=20
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 5cc82954e1ce..f89b9cfc4309 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -271,6 +271,7 @@ static int raspberrypi_discover_clocks(struct raspber=
rypi_clk *rpi,
>  		case RPI_FIRMWARE_CORE_CLK_ID:
>  		case RPI_FIRMWARE_M2MC_CLK_ID:
>  		case RPI_FIRMWARE_V3D_CLK_ID:
> +		case RPI_FIRMWARE_PIXEL_BVB_CLK_ID:
>  			hw =3D raspberrypi_clk_register(rpi, clks->parent,
>  						      clks->id);
>  			if (IS_ERR(hw))

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-bRnBewXchSGzBuzQX1iH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9XrMgACgkQlfZmHno8
x/5Piwf8CYoN2PUqTObU8bIxbxLs0x5KdJ0l4F+I0cw3UhAtM8A0+OSU2hOZLEHH
xgw/OG9Ejn4mG6V32drl5FuTcGuXO1q0z+dJn7B33mtBHFUy2XX9Qk1RdsBcjt38
wdTxlupb/ggrkqeTEH7wOjVteRHGa/mSsKnGnLUJhNPQd3L5EMRKdQ+wUJnbE0E2
5nDJ8W0+oIgbDoP5KVhduAV17jWQ9OoAZEffeX9KQ6z+HOs5/rKQRrKw+38Tv2DO
JuWd8XPDem3+KJ89G8ohVWn6ugsoLX77V+6U5cp8Tp/5WtLBqa7p7Y852GB1jn+T
IIUkypxQvzYaa6gNlQguSSORoALCxw==
=VNO1
-----END PGP SIGNATURE-----

--=-bRnBewXchSGzBuzQX1iH--


--===============2143731548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2143731548==--

