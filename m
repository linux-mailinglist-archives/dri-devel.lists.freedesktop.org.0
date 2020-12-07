Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A1F2D1289
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC1A89D8D;
	Mon,  7 Dec 2020 13:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE2D89D8D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:51:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0353DAC90;
 Mon,  7 Dec 2020 13:51:29 +0000 (UTC)
Subject: Re: [PATCH v3 11/13] video: fbdev: efifb: Fix set but not used
 warning for screen_pitch
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-12-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5ddfb821-8c2f-89df-99fe-298ac9d68d76@suse.de>
Date: Mon, 7 Dec 2020 14:51:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-12-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0816718754=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0816718754==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UUhWOiX6zSGxJwfPk2Dadgy2X7vakE37Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UUhWOiX6zSGxJwfPk2Dadgy2X7vakE37Y
Content-Type: multipart/mixed; boundary="lCVTJBEB2DqM0UFonqvKomR7vvbpzMa9l";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Alexander Klimov <grandmaster@al2klimov.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Gustavo A R Silva <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@kernel.org>, Peter Jones <pjones@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Qilong Zhang
 <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rich Felker <dalias@libc.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Tony Prisk <linux@prisktech.co.nz>
Message-ID: <5ddfb821-8c2f-89df-99fe-298ac9d68d76@suse.de>
Subject: Re: [PATCH v3 11/13] video: fbdev: efifb: Fix set but not used
 warning for screen_pitch
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-12-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-12-sam@ravnborg.org>

--lCVTJBEB2DqM0UFonqvKomR7vvbpzMa9l
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
> screen_pitch was asssigned a value which was never used.
> Drop it to fix the warning
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Peter Jones <pjones@redhat.com>
> Cc: linux-fbdev@vger.kernel.org

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/efifb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index e57c00824965..b80ba3d2a9b8 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -139,7 +139,7 @@ static bool efifb_bgrt_sanity_check(struct screen_i=
nfo *si, u32 bmp_width)
>  =20
>   static void efifb_show_boot_graphics(struct fb_info *info)
>   {
> -	u32 bmp_width, bmp_height, bmp_pitch, screen_pitch, dst_x, y, src_y;
> +	u32 bmp_width, bmp_height, bmp_pitch, dst_x, y, src_y;
>   	struct screen_info *si =3D &screen_info;
>   	struct bmp_file_header *file_header;
>   	struct bmp_dib_header *dib_header;
> @@ -193,7 +193,6 @@ static void efifb_show_boot_graphics(struct fb_info=
 *info)
>   	bmp_width =3D dib_header->width;
>   	bmp_height =3D abs(dib_header->height);
>   	bmp_pitch =3D round_up(3 * bmp_width, 4);
> -	screen_pitch =3D si->lfb_linelength;
>  =20
>   	if ((file_header->bitmap_offset + bmp_pitch * bmp_height) >
>   				bgrt_image_size)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lCVTJBEB2DqM0UFonqvKomR7vvbpzMa9l--

--UUhWOiX6zSGxJwfPk2Dadgy2X7vakE37Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/OM14FAwAAAAAACgkQlh/E3EQov+CP
IQ/+L432K3gimY1wgKAfFPFLLqwBI8N1N4+Ftj71loVfWxFMiCrL4wkh8OJVRpjntNSz7NuuF7ix
vRBDdhQz230JWE6U2+mwXQR2h43j0MNbYF1OqY/tyjPb2dmZz2vt9KkB4989+jCL67CCAxJBezxD
kmWyHyFS2NK31vCK5HH1fyhPLDxdOlz7FQ0pnknyuMEojkTpNhPIX0qkVry4xfto+4cLgV9qrtCq
icX/6HTHgeXKzlDKxgscab8PYrbC44gsoHTight/Ygor/cXj5IxGZNzmZeOJhyWYcfpN3AousRRm
KWvqvzc2fbdgj88Wg7IUd7y9t+gP7yH5hzVf5wtrGB/cnd+4+sP53XmYMgOlh/mNx2zlT8s0VetE
CJJFwyqRFDg06xhtlZlLsej1dId13la8yCPm5dZhFPKi/urKqDMuciOAZ1Ak7rWYyT27vwMglBG+
z3QoAi4w50q8ZUNZ3lP0GYN16A+lcHNze11yoY+20QERmicjNMsyKYWVJ7wtBkjeG04ID5nC12Yb
sWWq/+R8nPU/FHs/Nzpb1L+way0thOKm+tCA16wonwYYF16qXGFcdGeK4KtI3LeBUwPB63I1DmSm
bpZblj7oyFlsbGfqNvxYfxoAGFf6Y5zTysubIuoUsFRET/uRadnB/2FKwWy8bsqlM1XF6wxKA+Cm
IIA=
=QjfE
-----END PGP SIGNATURE-----

--UUhWOiX6zSGxJwfPk2Dadgy2X7vakE37Y--

--===============0816718754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0816718754==--
