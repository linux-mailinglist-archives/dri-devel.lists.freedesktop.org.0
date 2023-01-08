Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A1661886
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 20:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8E910E011;
	Sun,  8 Jan 2023 19:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 41530 seconds by postgrey-1.36 at gabe;
 Sun, 08 Jan 2023 19:28:32 UTC
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net
 [87.98.165.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DA410E011
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 19:28:32 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.32])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id E28D923A36
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 19:28:30 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-jkvnz (unknown [10.110.115.217])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5F9761FF09;
 Sun,  8 Jan 2023 19:28:25 +0000 (UTC)
Received: from sk2.org ([37.59.142.109])
 by ghost-submission-6684bf9d7b-jkvnz with ESMTPSA
 id EegsFFkZu2NcfgEALOiSWw
 (envelope-from <steve@sk2.org>); Sun, 08 Jan 2023 19:28:25 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00347102589-c051-4779-a238-3104c8c3a5ba,
 5128B599F7D401446F64D4771BE19AB2B9CD7A8B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Sun, 8 Jan 2023 20:28:17 +0100
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Subject: Re: [PATCH 09/15] staging: fbtft: fb_ssd1351.c: Introduce
 backlight_is_blank()
Message-ID: <20230108202817.7890f85c@heffalump.sk2.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7r7u4ublxCZJ9BAQVs4mie8";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 1827898502950454918
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeggdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepfeffgefhgfeuueeffeejieefieefgfefffethfdtudegvdejueelhffhfeegjeeinecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
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
 linux-staging@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sam@ravnborg.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin van der Gracht <robin@protonic.nl>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jingoo Han <jingoohan1@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7r7u4ublxCZJ9BAQVs4mie8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Jan 2023 19:26:23 +0100, Sam Ravnborg via B4 Submission Endpoint
<devnull+sam.ravnborg.org@kernel.org> wrote:

> From: Sam Ravnborg <sam@ravnborg.org>
>=20
> Avoiding direct access to backlight_properties.props.
>=20
> Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> Access to props.power is dropped - it was only used for debug.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Kitt <steve@sk2.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/staging/fbtft/fb_ssd1351.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/fbtft/fb_ssd1351.c
> b/drivers/staging/fbtft/fb_ssd1351.c index b8d55aa8c5c7..995fbd2f3dc6 100=
644
> --- a/drivers/staging/fbtft/fb_ssd1351.c
> +++ b/drivers/staging/fbtft/fb_ssd1351.c
> @@ -190,15 +190,12 @@ static struct fbtft_display display =3D {
>  static int update_onboard_backlight(struct backlight_device *bd)
>  {
>  	struct fbtft_par *par =3D bl_get_data(bd);
> -	bool on;
> +	bool blank =3D backlight_is_blank(bd);
> =20
> -	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> -		      "%s: power=3D%d, fb_blank=3D%d\n",
> -		      __func__, bd->props.power, bd->props.fb_blank);
> +	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: blank=3D%d\n", __func__,
> blank);=20
> -	on =3D !backlight_is_blank(bd);
>  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
> -	write_reg(par, 0xB5, on ? 0x03 : 0x02);
> +	write_reg(par, 0xB5, !blank ? 0x03 : 0x02);
> =20
>  	return 0;
>  }
>=20
> --=20
> 2.34.1

For debugging purposes here, would there be any point in logging props.stat=
e?
As in

        fbtft_par_dbg(DEBUG_BACKLIGHT, par,
-                     "%s: power=3D%d, fb_blank=3D%d\n",
-                     __func__, bd->props.power, bd->props.fb_blank);
+                     "%s: power=3D%d, state=3D%u\n",
+                     __func__, bd->props.power, bd->props.state);

In any case,

Reviewed-by: Stephen Kitt <steve@sk2.org>

Regards,

Stephen

--Sig_/7r7u4ublxCZJ9BAQVs4mie8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO7GVIACgkQgNMC9Yht
g5x37A/7B3puI8clzUcFlUoGWvM7pLm9F6edVmfW2Ck32NHOFEQ+oECUWSeX2T5+
Ol8So/dDrSXGuqFUKEAjbn++F54QGE2LveKquiPDIOxwQMiZQdj8WvqLHWe3qzv2
e1Am1nIijJ6mEph2pnKUhoriwloWC1EsY+au3CjU9iWdVa57tyeRUL4hScUpelyr
6ysQxU3G0Rd5xkVe3V1RCHwxu7x6IK7lcQbk+9HpN1N3yDSTPZjHJAuIsVZYjlly
TBc0BMhZGwK4XHcRi03Sm6rby7tNS+uZilljBtMjOKfDZx1M53iReLmQFMwk4pTb
e0mC/zdp6MaGDdYI5FavZkHC8OOmKvfZnOKGZnuxdE5XERx9j7FoSPrm1/PrkAop
1X+Ku2r+JKw96kq+pRg2I2zbtODbjrRdK6GmrDUZznfG5aMcZeZqDXnBMOBeolZz
rjGVMeDzt2xJGCFIUFyiWnqwRoFoPkXs5cEklkYfszxnLnuWA20EhaWTpL1+w89k
d0LymgENWcL7IzaazX/FOaX950T5K0iIGd7EnKR3R7eLYq/4W3fa2v/wNR2NehQs
nP39LfiNX7brah5GIfGlQanv9YxJ7XaqUEVyKkC9Y37SpTfzbzuVY0ndx+z1Y3zD
sDB0Ut1gNyL4DjtVgMu8Q9miiMuDKyL41MaxMEZpcKYIfQIEhVU=
=y2dJ
-----END PGP SIGNATURE-----

--Sig_/7r7u4ublxCZJ9BAQVs4mie8--
