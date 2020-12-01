Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38602CA572
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 15:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086C06E546;
	Tue,  1 Dec 2020 14:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21E96E546
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:22:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25905AC55;
 Tue,  1 Dec 2020 14:22:02 +0000 (UTC)
Subject: Re: [PATCH v2 27/28] video: fbdev: cirrusfb: Fix kernel-doc and set
 but not used warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-28-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c8f1f756-15eb-cc50-caad-2a9391481884@suse.de>
Date: Tue, 1 Dec 2020 15:21:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-28-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1686718023=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1686718023==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jkay5XN5eCFJwvlppXfHVem7SswagP4H2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jkay5XN5eCFJwvlppXfHVem7SswagP4H2
Content-Type: multipart/mixed; boundary="8VjS9hrC1dgypeYDscnVkBVM1UNktgF24";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Alex Dewar <alex.dewar90@gmail.com>, Antonino Daplas <adaplas@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Evgeny Novikov <novikov@ispras.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Silva <gustavoars@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Jason Yan <yanaijie@huawei.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Joe Perches <joe@perches.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Peter Rosin <peda@axentia.se>, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <c8f1f756-15eb-cc50-caad-2a9391481884@suse.de>
Subject: Re: [PATCH v2 27/28] video: fbdev: cirrusfb: Fix kernel-doc and set
 but not used warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-28-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-28-sam@ravnborg.org>

--8VjS9hrC1dgypeYDscnVkBVM1UNktgF24
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix warnings:
> - drop kernel-doc for the two debug functions to avoid the warnings
> - delete unused code
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimemrmann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/video/fbdev/cirrusfb.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirru=
sfb.c
> index e9027172c0f5..93802abbbc72 100644
> --- a/drivers/video/fbdev/cirrusfb.c
> +++ b/drivers/video/fbdev/cirrusfb.c
> @@ -2463,8 +2463,6 @@ static void AttrOn(const struct cirrusfb_info *ci=
nfo)
>    */
>   static void WHDR(const struct cirrusfb_info *cinfo, unsigned char val=
)
>   {
> -	unsigned char dummy;
> -
>   	if (is_laguna(cinfo))
>   		return;
>   	if (cinfo->btype =3D=3D BT_PICASSO) {
> @@ -2473,18 +2471,18 @@ static void WHDR(const struct cirrusfb_info *ci=
nfo, unsigned char val)
>   		WGen(cinfo, VGA_PEL_MSK, 0x00);
>   		udelay(200);
>   		/* next read dummy from pixel address (3c8) */
> -		dummy =3D RGen(cinfo, VGA_PEL_IW);
> +		RGen(cinfo, VGA_PEL_IW);

I hope these kinds of changes do not turn into an endless stream of=20
warnings from static ananlysis. I git an email with that today about=20
such a call.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   		udelay(200);
>   	}
>   	/* now do the usual stuff to access the HDR */
>  =20
> -	dummy =3D RGen(cinfo, VGA_PEL_MSK);
> +	RGen(cinfo, VGA_PEL_MSK);
>   	udelay(200);
> -	dummy =3D RGen(cinfo, VGA_PEL_MSK);
> +	RGen(cinfo, VGA_PEL_MSK);
>   	udelay(200);
> -	dummy =3D RGen(cinfo, VGA_PEL_MSK);
> +	RGen(cinfo, VGA_PEL_MSK);
>   	udelay(200);
> -	dummy =3D RGen(cinfo, VGA_PEL_MSK);
> +	RGen(cinfo, VGA_PEL_MSK);
>   	udelay(200);
>  =20
>   	WGen(cinfo, VGA_PEL_MSK, val);
> @@ -2492,7 +2490,7 @@ static void WHDR(const struct cirrusfb_info *cinf=
o, unsigned char val)
>  =20
>   	if (cinfo->btype =3D=3D BT_PICASSO) {
>   		/* now first reset HDR access counter */
> -		dummy =3D RGen(cinfo, VGA_PEL_IW);
> +		RGen(cinfo, VGA_PEL_IW);
>   		udelay(200);
>  =20
>   		/* and at the end, restore the mask value */
> @@ -2800,9 +2798,9 @@ static void bestclock(long freq, int *nom, int *d=
en, int *div)
>  =20
>   #ifdef CIRRUSFB_DEBUG
>  =20
> -/**
> +/*
>    * cirrusfb_dbg_print_regs
> - * @base: If using newmmio, the newmmio base address, otherwise %NULL
> + * @regbase: If using newmmio, the newmmio base address, otherwise %NU=
LL
>    * @reg_class: type of registers to read: %CRT, or %SEQ
>    *
>    * DESCRIPTION:
> @@ -2847,7 +2845,7 @@ static void cirrusfb_dbg_print_regs(struct fb_inf=
o *info,
>   	va_end(list);
>   }
>  =20
> -/**
> +/*
>    * cirrusfb_dbg_reg_dump
>    * @base: If using newmmio, the newmmio base address, otherwise %NULL=

>    *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8VjS9hrC1dgypeYDscnVkBVM1UNktgF24--

--jkay5XN5eCFJwvlppXfHVem7SswagP4H2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GUYcFAwAAAAAACgkQlh/E3EQov+CK
ZRAAw0xfE1lIpt8lSuFNK6wHmxLZbHloGgq2UXThDlcqAl+dXRmnAYfb2CFeRS7MfscbE7s0osv0
J5pQHbVZQXfkw+9cEguKdBK3CFiZQucaOzJlroMZaw6CpwZLsRVyPUPtwXuv33DBm4qLrpjtjCfe
lBp7TPKpW7TFsxTAWWn+ERjUDPZhy1dovlkTp5UAvNSa0dMLTzxifoM5WvqJncN3fuQ/l9lwKh6R
EwiKuZy3qoIP6o+KMSOy7iSL3rZ+4lqyBSA5hn7Kyzwl4lz4w2z4HBwNp0Ifiy00wCafEhgnSMho
v9X9DAHesr9NhlT8i8ayouUXjKBnEbEXDg3gtX01aaDaQTkOsoJJP/ppB3nKbndWhTIodmWVWRdb
qg3Fy1VmQerCuRNJsMOznyrKiyj4ud1cJv/mDlWpk53/wcEOScHEO9h9cOPYBPkwBzH83IwSQ4In
ZVUa8y0c7UtHtOBTr/AKCbFJV2xQJk+BzqLqn++AT77bWHOamm1YTs/ZXeSFDcmNlD6Z9ayYcU6S
6WFakT2U1B3sNAwPR3d+RMzzuuMJxCLsdBxQM9soEWgfuqAFu+HXHg0JCnJciq7rUb9EzT/D17uh
6GdGDbf94Aa33uYcUWBNxn3OBUDlwTBDToI8LkB4BQG4VSux/8YLhqkXzf1vgqscW9+il8aJW+3e
1cQ=
=gtn9
-----END PGP SIGNATURE-----

--jkay5XN5eCFJwvlppXfHVem7SswagP4H2--

--===============1686718023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1686718023==--
