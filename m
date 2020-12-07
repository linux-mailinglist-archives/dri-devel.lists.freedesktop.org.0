Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E32D1279
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F466E573;
	Mon,  7 Dec 2020 13:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130486E573
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:48:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85EA6AC90;
 Mon,  7 Dec 2020 13:48:26 +0000 (UTC)
Subject: Re: [PATCH v3 07/13] video: fbdev: mmp: Fix kernel-doc warning for
 lcd_spi_write
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-8-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <60d3548a-833b-6247-f1f2-20f9b0fc0098@suse.de>
Date: Mon, 7 Dec 2020 14:48:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-8-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============0102706491=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0102706491==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="keDAahjnpMjF6lOwy0GHcGQHD76owIQba"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--keDAahjnpMjF6lOwy0GHcGQHD76owIQba
Content-Type: multipart/mixed; boundary="E6Czz1MS3FrkSrCKsvH3iR0CySa7tPFs1";
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
Message-ID: <60d3548a-833b-6247-f1f2-20f9b0fc0098@suse.de>
Subject: Re: [PATCH v3 07/13] video: fbdev: mmp: Fix kernel-doc warning for
 lcd_spi_write
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-8-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-8-sam@ravnborg.org>

--E6Czz1MS3FrkSrCKsvH3iR0CySa7tPFs1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
> Add missing parameter and drop parameter that is not present
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/mmp/hw/mmp_spi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/mmp/hw/mmp_spi.c b/drivers/video/fbdev=
/mmp/hw/mmp_spi.c
> index 1911a47769b6..16401eb95c6c 100644
> --- a/drivers/video/fbdev/mmp/hw/mmp_spi.c
> +++ b/drivers/video/fbdev/mmp/hw/mmp_spi.c
> @@ -17,8 +17,8 @@
>  =20
>   /**
>    * spi_write - write command to the SPI port
> + * @spi:  the SPI device.
>    * @data: can be 8/16/32-bit, MSB justified data to write.
> - * @len:  data length.
>    *
>    * Wait bus transfer complete IRQ.
>    * The caller is expected to perform the necessary locking.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--E6Czz1MS3FrkSrCKsvH3iR0CySa7tPFs1--

--keDAahjnpMjF6lOwy0GHcGQHD76owIQba
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/OMqcFAwAAAAAACgkQlh/E3EQov+Dr
KhAAut37TrgGrSl2E2r7ye2J6mVmlvjRdFRmgZEuxOUksxxVWHqCHv7hEs0uvzUqAYv3l8nwiuY6
FX2FiXsYGfySie4tzo92F9IivjN4k5oU54SHO9GwXDn8BuBxG/dQC7NTX99YF7dQQx/kPxsHA+Nz
dqMowEU5ImakEEXnB330xGlvT+KrSSVOX6EVjMboFtqGpGlgbgf+W+ypV8LX8Iv/Vkk7lLgAz+7G
w1SqvkAO/7TrC3F4qtJylfvoMxg9M+/k8yOWyRhrVSRWOFYPFvm7gx1hsZsxVma9yQzib0zEJPx8
lHFE9nEOrMJIxAqLBiina4/dLQlLdFVf+0p3tvbayCoGwUvpziE9tBLUSwkncdDCaiDAqex2MHro
gpUzOlU3w6NMMny26PxTGcAAXGugjXxnZLpXN5GDfg//6lIhRwIqcKjwro5K+dqTqf+QnNcvPJ0g
yux1SqFZpzPXhpKGJTZY29/UkM0CWykfKkosR8gdphXr9Clhkj9eRYjd9aklVQ/i9fxWXDesDHlT
B/FQ25AGoRblJ0eoVzG8NAhqKukZRPARV7im5wG4InxQD23o3gXgkKDxg6jg4957VOyFNnITOfNd
D0oxn5e9Zy+d8E9s1iK6UxTKVbb4RT45Ltsmu5yRlcCAsNgGjdI9hzw8/r5kkN6rvnnRKth0FS4O
zWM=
=AnqY
-----END PGP SIGNATURE-----

--keDAahjnpMjF6lOwy0GHcGQHD76owIQba--

--===============0102706491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0102706491==--
