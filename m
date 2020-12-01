Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3D2CA571
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 15:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E01289CB9;
	Tue,  1 Dec 2020 14:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3468489DD8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:20:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABE3FAC55;
 Tue,  1 Dec 2020 14:20:00 +0000 (UTC)
Subject: Re: [PATCH v2 26/28] video: fbdev: uvesafb: Fix string related
 warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-27-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <371d184b-2a7c-6135-4816-635684d8481d@suse.de>
Date: Tue, 1 Dec 2020 15:19:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-27-sam@ravnborg.org>
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
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1592878461=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1592878461==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JfZld2eGqcvHKT9MDWgJ3Txd9h3PcmMoU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JfZld2eGqcvHKT9MDWgJ3Txd9h3PcmMoU
Content-Type: multipart/mixed; boundary="UBR5qugZwEwYLrXvY9M5OibDwLul69cQx";
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
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan
 <tanxiaofei@huawei.com>, Michal Januszewski <spock@gentoo.org>
Message-ID: <371d184b-2a7c-6135-4816-635684d8481d@suse.de>
Subject: Re: [PATCH v2 26/28] video: fbdev: uvesafb: Fix string related
 warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-27-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-27-sam@ravnborg.org>

--UBR5qugZwEwYLrXvY9M5OibDwLul69cQx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Two W=3D1 string related warnings.
> - Using strncpy to copy string without null-termination generates a
>    warning.  Use memcpy to copy only the relevant chars
>=20
> - Fix a potential bug with a very long string, subtract one from the
>    length to make room for the termination null.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Januszewski <spock@gentoo.org>
> Cc: linux-fbdev@vger.kernel.org
> ---
>   drivers/video/fbdev/uvesafb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesaf=
b.c
> index 8ee0fc9c63cf..45dc8da191e4 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -423,7 +423,7 @@ static int uvesafb_vbe_getinfo(struct uvesafb_ktask=
 *task,
>   	task->t.flags =3D TF_VBEIB;
>   	task->t.buf_len =3D sizeof(struct vbe_ib);
>   	task->buf =3D &par->vbe_ib;
> -	strncpy(par->vbe_ib.vbe_signature, "VBE2", 4);
> +	memcpy(par->vbe_ib.vbe_signature, "VBE2", 4);
>  =20
>   	err =3D uvesafb_exec(task);
>   	if (err || (task->t.regs.eax & 0xffff) !=3D 0x004f) {
> @@ -1871,7 +1871,7 @@ static ssize_t v86d_show(struct device_driver *de=
v, char *buf)
>   static ssize_t v86d_store(struct device_driver *dev, const char *buf,=

>   		size_t count)
>   {
> -	strncpy(v86d_path, buf, PATH_MAX);
> +	strncpy(v86d_path, buf, PATH_MAX - 1);

 From lookign a the drive rcode, I assume that the code never touches=20
the final byte in v86d_path. So it remains \0 indefinitely.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   	return count;
>   }
>   static DRIVER_ATTR_RW(v86d);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--UBR5qugZwEwYLrXvY9M5OibDwLul69cQx--

--JfZld2eGqcvHKT9MDWgJ3Txd9h3PcmMoU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GUQ0FAwAAAAAACgkQlh/E3EQov+A4
whAAmnx+/ghdkNbUQYtMRgGcEtLA8ikDqj18hnPB20yzGCeEuIHaNDHGkA3gkDz6/NdseY/8mGhe
LcJf7e3PGZSRzGhZ5Vwiagdl+44SO5pwj6HFNxU/uq9dnWGHaBi/rbRw+S8acKmWg5lKaWS+oW5H
CYwZdRRr7iQPwvk/YJJt93Vda2QArCNcn8EtuR27YJZ50KPhEXbBu8iRdvEEoOiH5cbOPPyBgcR+
j/q7uaWlAZ3Oc9RlkLK2iNPZ53mKQ6bWzUamuA7OG0eL16kRSNW/zs9c54Pwo51BwTQrfhDHnblr
ejDz71Fw+m6mRYFF40TMuWSYmTzXgRQYxJOr4BFHomD0Muwy3YyPnMjamjFD9N2Bd+NBHUbhS2Ul
z2KvNsfTp+1VFk6rgigdbhUq4zPCIxxWUNGOy3RBTAbQdjoPcWZU/Hhpfk5RSuINWRZ4EINuhD+p
y2WJA9P9Zzr4liDcMY38Rnx0i/fCIjtPtF4VCoTq8WENwljVUoRbWj1J5Pl2nWH/E1LuDWYSrDDK
SN4RnLPCVuqJFFgUkm0AYsEgOiqb0Sra7qn2fyZ3Aqsxdx8bbXJp7JbKN3e/KCO2YNnepjPGLoRT
4alss5WQ40bh2UH6mf23vcGho6RMmq1iwzLRSxRhHXQ5FMXnU7d+Win722SjMTgaG0GdgmkmB8kB
PFY=
=umm4
-----END PGP SIGNATURE-----

--JfZld2eGqcvHKT9MDWgJ3Txd9h3PcmMoU--

--===============1592878461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1592878461==--
