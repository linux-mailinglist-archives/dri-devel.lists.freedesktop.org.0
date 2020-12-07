Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC52D0BA3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787FB8992E;
	Mon,  7 Dec 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED84D8992E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:19:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B056AD4A;
 Mon,  7 Dec 2020 08:19:58 +0000 (UTC)
Subject: Re: [PATCH v3 05/13] sh: Fix set but not used warnings with
 !CONFIG_MMU
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-6-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5898de38-a8bb-0b12-e6c1-f7d8a4ea1e5e@suse.de>
Date: Mon, 7 Dec 2020 09:19:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-6-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============0503698235=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0503698235==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9H5BNjCuIFTY6tpt2sPpHzia3K44WDeKS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9H5BNjCuIFTY6tpt2sPpHzia3K44WDeKS
Content-Type: multipart/mixed; boundary="3DPXPP4aUZ153U97gC1JfOk2hhT42kcYe";
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
Message-ID: <5898de38-a8bb-0b12-e6c1-f7d8a4ea1e5e@suse.de>
Subject: Re: [PATCH v3 05/13] sh: Fix set but not used warnings with
 !CONFIG_MMU
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-6-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-6-sam@ravnborg.org>

--3DPXPP4aUZ153U97gC1JfOk2hhT42kcYe
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
> Building fbdev drivers for sh with W=3D1 produces the following warning=
:
>=20
>      tmiofb.c: In function =E2=80=98tmiofb_remove=E2=80=99:
>      tmiofb.c:805:21: warning: variable =E2=80=98par=E2=80=99 set but n=
ot used
>=20
> This is with allmodconfig and ARCH=3Dsh
>=20
> This boiled down to iounmap() defined as empty for !CONFIG_MMU.
> Fix this by by adding "(void)addr;" to tell the compiler the
> argument to iounmap() should be considered used.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   arch/sh/include/asm/io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
> index 6d5c6463bc07..5ad56c6c1e1e 100644
> --- a/arch/sh/include/asm/io.h
> +++ b/arch/sh/include/asm/io.h
> @@ -271,7 +271,7 @@ static inline void __iomem *ioremap_prot(phys_addr_=
t offset, unsigned long size,
>   #endif /* CONFIG_HAVE_IOREMAP_PROT */
>  =20
>   #else /* CONFIG_MMU */
> -#define iounmap(addr)		do { } while (0)
> +#define iounmap(addr)		do { (void)addr; } while (0)
>   #define ioremap(offset, size)	((void __iomem *)(unsigned long)(offset=
))
>   #endif /* CONFIG_MMU */
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3DPXPP4aUZ153U97gC1JfOk2hhT42kcYe--

--9H5BNjCuIFTY6tpt2sPpHzia3K44WDeKS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N5awFAwAAAAAACgkQlh/E3EQov+DI
RA/+IavdE6N8ameVFFX/mBxJNTowUTEAj8v4gU/giooB4tylvVZPOJh2Ce/nt1RDbyZ6qn8Jo4xE
uGJy6aaHJypvWaNWick3UW2LqFKlZ+65U9dYYes+9EmJZGkcR1ikG7cP03gIB8YTZAi0yYWFu63L
apVxhrmWyijTT7KN58DD5roklRlwcM667zxhWa5wa7sbkMnwEruiIlc4zlCpJqKAHfnanrqtSgv9
u/qEdxG8cQG6QBAALE2MJaTg8HL0C2YqKBh/pB7SaLM2PybvUxKwcuXx6aUqfxc/1ruOfMV7HxFU
sTPYzq6eCBX91pqmMZEEZ2oIK0ni1rOnpNOS9ffhazygcP3Aa3Umt3QpGk+9DF2W49bGh+55KPi5
+kHGG0Vx29QmrvU+8OX6wXBIrZe8DiZZYf9EIMyPxWDFoetUZ+q3ZPv7czqrkL4jkae/XqF6pIKa
r3KZE8bFs8/iBt34Xb8IViL0u7H9iEjrqGDN8cAdq+L+Ejeiv+V72WXdGVTcHTD3RnrD6nNxMmHT
6yt1yD8sfezLtmOd9QZZDK8/LgdQiVTXKvegGWX9YKHN/kxULYwzkRAtFUwaZlQ4Bu6iti4FzFqE
raYml9RuRug/OElQ5239tSiqA/utwM/YMTijunN19CoKtA60/immYEsl/5Lqxm81iIZxTrsuQzVD
ekc=
=bHRQ
-----END PGP SIGNATURE-----

--9H5BNjCuIFTY6tpt2sPpHzia3K44WDeKS--

--===============0503698235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0503698235==--
