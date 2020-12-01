Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FEB2C9ECB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792A56E51A;
	Tue,  1 Dec 2020 10:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765766E51A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:09:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1DC5ACF4;
 Tue,  1 Dec 2020 10:09:10 +0000 (UTC)
Subject: Re: [PATCH v2 25/28] video: fbdev: uvesafb: Fix set but not used
 warning
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-26-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4191b9d7-3e53-7a0e-4d8d-c9c9ec8fa814@suse.de>
Date: Tue, 1 Dec 2020 11:09:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-26-sam@ravnborg.org>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Jani Nikula <jani.nikula@intel.com>,
 Aditya Pakki <pakki001@umn.edu>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1784469158=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1784469158==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BuBuE6ETJyeoXrRgBLrPpxKOQ3jUnffHZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BuBuE6ETJyeoXrRgBLrPpxKOQ3jUnffHZ
Content-Type: multipart/mixed; boundary="21zkJXPzm2sRL4MSqPz0EfFefti2Tgxqs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Michal Januszewski <spock@gentoo.org>,
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
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap
 <rdunlap@infradead.org>, Gustavo Silva <gustavoars@kernel.org>,
 Peter Rosin <peda@axentia.se>, George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Jingoo Han <jingoohan1@gmail.com>, Joe Perches <joe@perches.com>,
 Peilin Ye <yepeilin.cs@gmail.com>, Mike Rapoport <rppt@kernel.org>
Message-ID: <4191b9d7-3e53-7a0e-4d8d-c9c9ec8fa814@suse.de>
Subject: Re: [PATCH v2 25/28] video: fbdev: uvesafb: Fix set but not used
 warning
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-26-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-26-sam@ravnborg.org>

--21zkJXPzm2sRL4MSqPz0EfFefti2Tgxqs
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fix W=3D1 warning by deleting unused local variable.
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Januszewski <spock@gentoo.org>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/video/fbdev/uvesafb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesaf=
b.c
> index def14ac0ebe1..8ee0fc9c63cf 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -554,12 +554,12 @@ static int uvesafb_vbe_getmodes(struct uvesafb_kt=
ask *task,
>   static int uvesafb_vbe_getpmi(struct uvesafb_ktask *task,
>   			      struct uvesafb_par *par)
>   {
> -	int i, err;
> +	int i;
>  =20
>   	uvesafb_reset(task);
>   	task->t.regs.eax =3D 0x4f0a;
>   	task->t.regs.ebx =3D 0x0;
> -	err =3D uvesafb_exec(task);
> +	uvesafb_exec(task);

Would it be better to report the error here?

Best regards
Thomas

>  =20
>   	if ((task->t.regs.eax & 0xffff) !=3D 0x4f || task->t.regs.es < 0xc00=
0) {
>   		par->pmi_setpal =3D par->ypan =3D 0;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--21zkJXPzm2sRL4MSqPz0EfFefti2Tgxqs--

--BuBuE6ETJyeoXrRgBLrPpxKOQ3jUnffHZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GFkIFAwAAAAAACgkQlh/E3EQov+Bh
nQ//QFyXRggNsYo5mmiPC0E2RpBFOtWJ9nC9wPMtHglPPpVAf+tIzyOBl18Gk6WBdTf1EgYzWiVM
jt1dxCl2Rsg0wW88VVIJ+f29Asqm/agu4k4RUlxdYugtdksW8tiC6LbyXyiLVO8I2YOP6c9dH/h7
qaS3c8tqqKpLSyIgs/kT61Pm3ytLiDoixX5XMGxheaMDuTD/G5F72/zig3MfsUULkyTPPEVOQizV
n0qIYmAwzZuxQ+7LjX2+Wdtk354/haz9uETulwdnnmJApLo7iWD4INmoUYqJp/xLv7CXzD1uYfuD
Jbdd6ejosa5PmOSAcLyppMxxUtqO9jAGcnTN0GqokLdCsNebh9pq+cFP0hO4OC7+Af+Mr4H3tEmn
UfPjvllIHtImiyg+17rdVdle0TDzNgT+MU416MF6RqlMqSJJxrpGjJiFIyYtSZbx/ZPg8RlypRzT
YYhvSKqYjs2ANYn6JOqTXTOwPqpcd3xIyPBgXZSivjYm3miEcBW+2GAoWYliA5o1MGUxmWdQAdZs
q/RRhjJD+uy2/LrAmyf8Ez5BvlGAvz8pmy+Pr2GdX5o1WD0bhR1G9Bwy4h1gJpj7Dk2E43lS1B9p
JaCt8w8NWtk1U5WBFq3soRhxGkjYtugsUfpxMRyqzxq9kwizzq9MRRk36dXpevDhHJFBn24I3WpV
u9k=
=45uM
-----END PGP SIGNATURE-----

--BuBuE6ETJyeoXrRgBLrPpxKOQ3jUnffHZ--

--===============1784469158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1784469158==--
