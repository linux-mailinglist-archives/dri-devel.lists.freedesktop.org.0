Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC02D128F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE98B89D61;
	Mon,  7 Dec 2020 13:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806F389D61
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:52:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 113EEACF4;
 Mon,  7 Dec 2020 13:52:38 +0000 (UTC)
Subject: Re: [PATCH v3 12/13] video: fbdev: controlfb: Fix set but not used
 warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-13-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <39bdf3e7-8c44-251c-3d07-bccaf0b57232@suse.de>
Date: Mon, 7 Dec 2020 14:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-13-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1371709248=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1371709248==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7K9RMvebdbUZW5Z8ipJPNeE2ljwGrAkkJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7K9RMvebdbUZW5Z8ipJPNeE2ljwGrAkkJ
Content-Type: multipart/mixed; boundary="n6kugew9TCJp3NJ23QFcuxsfIQBOknSrz";
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
Message-ID: <39bdf3e7-8c44-251c-3d07-bccaf0b57232@suse.de>
Subject: Re: [PATCH v3 12/13] video: fbdev: controlfb: Fix set but not used
 warnings
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-13-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-13-sam@ravnborg.org>

--n6kugew9TCJp3NJ23QFcuxsfIQBOknSrz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
> The controlfb driver has a number of dummy defines for IO operations.
> They were introduced in commit a07a63b0e24d
> ("video: fbdev: controlfb: add COMPILE_TEST support").
>=20
> The write variants did not use their value parameter in the
> dummy versions, resulting in set but not used warnings.
> Fix this by adding "(void)val" to silence the compiler.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/controlfb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/cont=
rolfb.c
> index 2df56bd303d2..509311471d51 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -64,9 +64,9 @@
>   #undef in_le32
>   #undef out_le32
>   #define in_8(addr)		0
> -#define out_8(addr, val)
> +#define out_8(addr, val)	(void)(val)
>   #define in_le32(addr)		0
> -#define out_le32(addr, val)
> +#define out_le32(addr, val)	(void)(val)
>   #define pgprot_cached_wthru(prot) (prot)
>   #else
>   static void invalid_vram_cache(void __force *addr)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--n6kugew9TCJp3NJ23QFcuxsfIQBOknSrz--

--7K9RMvebdbUZW5Z8ipJPNeE2ljwGrAkkJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/OM6QFAwAAAAAACgkQlh/E3EQov+Cp
gQ//Z2QKFAITQMWsqXXo2zB5IeIxT6rELs2iruFBMadE1p9VDaev0xMKR2Yf2OptQeUPWbbpbd56
py+pHfi1aiZmZHXqLBZDwB+SWYawtohNIjUzPBdTM8LPpjOlZxKnJmsa+viwiR4gaGQEzsAF9rrS
Iuozg0Fn6BYZpyhTB6yxmPm1hpKhANnwyfYQ3Cerpf2M9uBAWZXC3tDiUjVvWPKkVMPxPd12dtem
6SdE8bsrabncw5E9v562iC3TUUiyVO9oHPbpsJ34K2ZxXl7jblvRcfyBY9DVlzJ6514c9WkZT/6A
bp2COOW2LHq7aGiXRHjKKADagWFo0pqcNAOObyUQqJY0Rtw8UkdqExtd65q4kPmezvBF213EtQ+i
lcXbpurreLx77VCRNZEp4Ezj72znNmWRX7EgLSiLFdm8e6GyA3QNbYlkXc3x286h4jD8xip1q10o
yFHUCjI96lSvKuNAeRsTUjgfi/rLC+DqqgnWKosW8DoyFeO7sTt08vCNmQF3EdoCErW9rp70+r42
mH39aAouj54lnjkhGFI3X2FEGI5oY5zb6mcF/UzK5YVfb+jD85mKHLp5xJM256FUiFNqe/jdAymo
RTVgpeWpPOQSWPGWuMqe6CRZArIDN/ktwtP6HXU0evK+6NlJpQt21+Kb0uy0BywPzSA4xGfcfNGo
5NQ=
=rPLK
-----END PGP SIGNATURE-----

--7K9RMvebdbUZW5Z8ipJPNeE2ljwGrAkkJ--

--===============1371709248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1371709248==--
