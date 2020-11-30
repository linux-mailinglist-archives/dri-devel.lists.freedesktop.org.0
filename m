Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4702C81E9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838CF6E448;
	Mon, 30 Nov 2020 10:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE36E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:14:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E73EABD2;
 Mon, 30 Nov 2020 10:14:13 +0000 (UTC)
Subject: Re: [PATCH v2 10/28] video: fbdev: sis: Fix set but not used warnings
 in sis_main
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-11-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <13590d76-7002-c8e9-a4b8-678594019d3d@suse.de>
Date: Mon, 30 Nov 2020 11:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-11-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1294768262=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1294768262==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EZFS9fifP3HAiz40HDUDdA0Rtgd9T5GRr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EZFS9fifP3HAiz40HDUDdA0Rtgd9T5GRr
Content-Type: multipart/mixed; boundary="BT3JQ8UCn039qRBxkN0a7FncAoNCJkgYo";
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
Message-ID: <13590d76-7002-c8e9-a4b8-678594019d3d@suse.de>
Subject: Re: [PATCH v2 10/28] video: fbdev: sis: Fix set but not used warnings
 in sis_main
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-11-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-11-sam@ravnborg.org>

--BT3JQ8UCn039qRBxkN0a7FncAoNCJkgYo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> Fix warnings by dropping unused variable and the
> unused assignments.
>=20
> v2:
>    - Update subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Winischhofer <thomas@winischhofer.net>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/sis/sis_main.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/s=
is/sis_main.c
> index 03c736f6f3d0..266a5582f94d 100644
> --- a/drivers/video/fbdev/sis/sis_main.c
> +++ b/drivers/video/fbdev/sis/sis_main.c
> @@ -5029,7 +5029,6 @@ static void sisfb_post_xgi_ddr2(struct sis_video_=
info *ivideo, u8 regb)
>   	static const u8 cs168[8] =3D {
>   		0x48, 0x78, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00
>   	};
> -	u8 reg;
>   	u8 v1;
>   	u8 v2;
>   	u8 v3;
> @@ -5037,9 +5036,9 @@ static void sisfb_post_xgi_ddr2(struct sis_video_=
info *ivideo, u8 regb)
>   	SiS_SetReg(SISCR, 0xb0, 0x80); /* DDR2 dual frequency mode */
>   	SiS_SetReg(SISCR, 0x82, 0x77);
>   	SiS_SetReg(SISCR, 0x86, 0x00);
> -	reg =3D SiS_GetReg(SISCR, 0x86);
> +	SiS_GetReg(SISCR, 0x86);
>   	SiS_SetReg(SISCR, 0x86, 0x88);
> -	reg =3D SiS_GetReg(SISCR, 0x86);
> +	SiS_GetReg(SISCR, 0x86);
>   	v1 =3D cs168[regb]; v2 =3D cs160[regb]; v3 =3D cs158[regb];
>   	if (ivideo->haveXGIROM) {
>   		v1 =3D bios[regb + 0x168];
> @@ -5049,9 +5048,9 @@ static void sisfb_post_xgi_ddr2(struct sis_video_=
info *ivideo, u8 regb)
>   	SiS_SetReg(SISCR, 0x86, v1);
>   	SiS_SetReg(SISCR, 0x82, 0x77);
>   	SiS_SetReg(SISCR, 0x85, 0x00);
> -	reg =3D SiS_GetReg(SISCR, 0x85);
> +	SiS_GetReg(SISCR, 0x85);
>   	SiS_SetReg(SISCR, 0x85, 0x88);
> -	reg =3D SiS_GetReg(SISCR, 0x85);
> +	SiS_GetReg(SISCR, 0x85);
>   	SiS_SetReg(SISCR, 0x85, v2);
>   	SiS_SetReg(SISCR, 0x82, v3);
>   	SiS_SetReg(SISCR, 0x98, 0x01);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BT3JQ8UCn039qRBxkN0a7FncAoNCJkgYo--

--EZFS9fifP3HAiz40HDUDdA0Rtgd9T5GRr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/ExfAFAwAAAAAACgkQlh/E3EQov+B+
2g/9Hrmlf7JHIJJjemAogj51K3DCkPZ87NVJK2YLdmnT7qxUc1zQ92GpQpmrc+aaD8MofvFIyJW7
DhR6Elu9LmE98SYJtfwErHgCV4W0wkKhr3f8j12ch7ctDXsRN+Vxj6x2rUQja+gCHvEWdwe8Z0qT
EEOVi1V97EYl7h430QXdR+Yqkd1uTnXxQuXBCncmZ3piOC7SBnbEM4qH3mi20QwQ4YkWBshNpTcn
8oV1cSN1Rmt8yJLE/OncbwRduOhMk5k64Iv2Wc6THQ0y9AF0sh1x/JwtqTt/lqi8NID+IZcT5TEZ
/tMRTf+MQhFoXlhLKuh2Set+DgCls1WYmmsA6ARgDnQeZx+x6+0ThQ4mdtgRjjFQeQ+Dos7C3EFW
Ja4qe4gxBdzUcPDwHQaThm7zzulewy8w31jDfe/YLE5brbzChQcMMjwJZTlHyrEgrEB48vA4xbyv
TqXR7KfRkrxmZU6FxpJlhbHmHmLH6ofj8Gm01oeOLDMdo1q5lAmy/0CmCNw4Yk1pYMugjKBfJ1KF
16VYDO+hRhkDjfCGo5rzt7U4k9cJUrRfavtRa9V4tbz8B8oQMO7OJWOR5Gp2RPnIFEcCJNKBK3qd
hDxdwzO7uF300dOuCF7VbxNqt1+D12hEZl18hFdzlzwSexEtPMERuOj3g/7O+dxMKB7kTs9KK7Rh
5i4=
=Io81
-----END PGP SIGNATURE-----

--EZFS9fifP3HAiz40HDUDdA0Rtgd9T5GRr--

--===============1294768262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1294768262==--
