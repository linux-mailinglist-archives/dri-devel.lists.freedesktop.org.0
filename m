Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19595417BD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 23:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735AD10FA8C;
	Tue,  7 Jun 2022 21:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9882 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 21:05:47 UTC
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net
 [188.165.53.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A76B10FA85
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 21:05:47 +0000 (UTC)
Received: from player789.ha.ovh.net (unknown [10.111.172.36])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 1D50A23DE8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 21:05:46 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 0ABE62B5538A1;
 Tue,  7 Jun 2022 21:05:39 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001d1b159e1-d9b9-415e-a5e3-929fdc4f1981,
 38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Tue, 7 Jun 2022 23:05:37 +0200
From: Stephen Kitt <steve@sk2.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: shmobile: Use backlight helper
Message-ID: <20220607230537.70020736@heffalump.sk2.org>
In-Reply-To: <20220607183132.1123648-1-steve@sk2.org>
References: <20220607183132.1123648-1-steve@sk2.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Feru9=Sd25PWm2MN7avRzyO";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 13666454546270291590
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtdefreertddvnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpefgueduteelfeduieejvdekgefhhfeihfeludekieduheejvdetjeehudekgeeiveenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejkeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedt
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Feru9=Sd25PWm2MN7avRzyO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 Jun 2022 20:31:32 +0200, Stephen Kitt <steve@sk2.org> wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.

Apologies for the misleading boilerplate, this patch came about as a result
of cleaning up fb_blank usage but doesn't involve fb_blank itself.

> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_backlight.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c index
> f6628a5ee95f..794573badfe8 100644 ---
> a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c +++
> b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c @@ -18,11 +18,7 @@ static
> int shmob_drm_backlight_update(struct backlight_device *bdev) struct
> shmob_drm_connector *scon =3D bl_get_data(bdev); struct shmob_drm_device
> *sdev =3D scon->connector.dev->dev_private; const struct
> shmob_drm_backlight_data *bdata =3D &sdev->pdata->backlight;
> -	int brightness =3D bdev->props.brightness;
> -
> -	if (bdev->props.power !=3D FB_BLANK_UNBLANK ||
> -	    bdev->props.state & BL_CORE_SUSPENDED)
> -		brightness =3D 0;
> +	int brightness =3D backlight_get_brightness(bdev);
> =20
>  	return bdata->set_brightness(brightness);
>  }
>=20
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --=20
> 2.30.2
>=20

--Sig_/Feru9=Sd25PWm2MN7avRzyO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKfvaEACgkQgNMC9Yht
g5yyqg//ZNax+mVnhXwYHAewRdmpO5KPLpY2tlkWgmNnYTqSJY4Q9Tl/zTJy1gFE
z2vfpM2i/9u9D6dNOnX2l3CzZf2fyfiv/HpuIlPbHPflW9/vfyaD+Mjuo8voa6Vq
4aoXjOR6jGBnTyNqcYjsFsTOUG9IZB4IEEpwP8YzJsaEnud+jRR1/+9/4OOJNFxX
m61GfvE6aLZHTqeT2yHHWUcKCF0TI/0m1NfYWR50Uw6vy1Ih6M2yOdnDK6SuJnpG
oEZ6j2qcTTzyL9wiq8Vwa2C9qE1qpgkitfOqbc+r1eRKFYh1dFMwgUrPovrL+7Bu
1jQZtgtwYRB/FRnwdvGL/GwWvOpHoBuYocRJemoytUdfVYd5W5wkb4zpfrwBfxUE
vFnJZqKL9yCR36MRyEs/UP7PbSJzxaH+GELP+BVoaHrrIe3GKEGTRzoHJGJm70Kf
Df1+GvfeSnifOY/0uhH9Rq+0xvynvqgRyovLeLcnX9+x4HQ7xl3MsmZamlQ0UgDl
cFgg7DTECV/VeLUmK0xT7LwFELd4LOQ+3Boys20qMo7QAwM4+FSuLPPxfZei9HUl
+baOJZ9yrn3R6eal+uyeTTPP/o/jZutqjbbmR5rXkBFReKsSksc9v/ddcFC8gmRF
gkfb0pq2m9/X5YGaQrfDffMNYdiXGuUARJUnxMhRP+kexEAnLXw=
=9c/g
-----END PGP SIGNATURE-----

--Sig_/Feru9=Sd25PWm2MN7avRzyO--
