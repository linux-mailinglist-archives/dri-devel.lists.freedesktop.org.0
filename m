Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DA2D0B9C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A1589CBA;
	Mon,  7 Dec 2020 08:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519CB89CBA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:18:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF387AC90;
 Mon,  7 Dec 2020 08:18:22 +0000 (UTC)
Subject: Re: [PATCH v3 04/13] video: fbdev: uvesafb: Fix set but not used
 warning
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-5-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3b53aee5-9589-3720-f0a1-c30c390eeb2f@suse.de>
Date: Mon, 7 Dec 2020 09:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-5-sam@ravnborg.org>
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
 Michal Januszewski <spock@gentoo.org>, Peter Jones <pjones@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1416404752=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1416404752==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LJMSVNL2afwccTQRS66KkxLg28hS8Od5u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LJMSVNL2afwccTQRS66KkxLg28hS8Od5u
Content-Type: multipart/mixed; boundary="wYeFGUNpMsCjQ1j0u8ZG1rJkwO3PFHGp2";
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
 Tony Prisk <linux@prisktech.co.nz>, Michal Januszewski <spock@gentoo.org>
Message-ID: <3b53aee5-9589-3720-f0a1-c30c390eeb2f@suse.de>
Subject: Re: [PATCH v3 04/13] video: fbdev: uvesafb: Fix set but not used
 warning
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-5-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-5-sam@ravnborg.org>

--wYeFGUNpMsCjQ1j0u8ZG1rJkwO3PFHGp2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
> Fix W=3D1 warning by deleting unused local variable.
>=20
> v2:
>    - Updated subject (Lee)
>=20
> v3:
>    - Return early in case of an error (Thomas)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Januszewski <spock@gentoo.org>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/uvesafb.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesaf=
b.c
> index 6c9cfab39313..4df6772802d7 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -560,6 +560,8 @@ static int uvesafb_vbe_getpmi(struct uvesafb_ktask =
*task,
>   	task->t.regs.eax =3D 0x4f0a;
>   	task->t.regs.ebx =3D 0x0;
>   	err =3D uvesafb_exec(task);
> +	if (err)
> +		return err;
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


--wYeFGUNpMsCjQ1j0u8ZG1rJkwO3PFHGp2--

--LJMSVNL2afwccTQRS66KkxLg28hS8Od5u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N5UwFAwAAAAAACgkQlh/E3EQov+Av
3g//cysUamSEEJE8FPFeFSFi8GL52DSPYZwpij7YlTgJV9rQ/qHzho240/Wy+3R7jxFzPp3T/3dh
dzEkog+FVVxT4tYZWsnX0q1+6suL1JNc4mAK3/Q5c/fu/0yqaNI16RVgTQEAm4/LqP3kA10VsumD
waCo0Vre61lf6XxGH1KXsnV9gvMsO8G/NwJjpAyz1e5Yh/rhohZ3vPbWyUq4+OywPYlDbVlaHyhw
u/PS1/v9lgBHrDMYvKp+a/W6QQeZJfy/WTzP7oSq0naGcns19h34UaydZinkvErs+EPZNKNAyV58
5n1syDBNeHIdkWZh2FsfwrfFIbLDEEvGOvx79SSdy48H6pJ173CWPo6PGupjfNgDS3GrIgIApV9q
COxRDX4C6QSLfs4bV8Ist4+PeRQG1NiuJ0OaBUA8CT0AZ2pqxtXUqz4iCkumTLihfbaDAFe9no/J
KIUn63ZA9ULge42WfDSI4qtkfRfKuVt2TIQ2y4uGFNOoJ4zzQ6AvcpwMjWtulj66+0YOqSMhDORi
y3kKdbCjZuqANgC++rWrEWiZSGf+qbWwbzzYMgMQsdu5PxpMnGnFWBGeMRuPJenroBizEZzV9NKU
nvYDQKfXiz70mt4vr9VqxSNu2orFvtHAOhbG9Yhh0nrx6maXPDDnqzpKrTkqC3IV9VvJhK81o3G2
yic=
=iTkE
-----END PGP SIGNATURE-----

--LJMSVNL2afwccTQRS66KkxLg28hS8Od5u--

--===============1416404752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1416404752==--
