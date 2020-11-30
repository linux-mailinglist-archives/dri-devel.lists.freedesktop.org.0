Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E919D2C806C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266026E40F;
	Mon, 30 Nov 2020 08:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951626E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:59:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CC4EAD8C;
 Mon, 30 Nov 2020 08:59:05 +0000 (UTC)
Subject: Re: [PATCH v2 07/28] video: fbdev: sis: Fix defined but not used
 warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-8-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1fb53984-6b19-0db2-6ed7-60e1cb3fb817@suse.de>
Date: Mon, 30 Nov 2020 09:59:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-8-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============0398537862=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0398537862==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HJIRrGsqj5PtOxbC0hRvnlo3IcQsYq2FP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HJIRrGsqj5PtOxbC0hRvnlo3IcQsYq2FP
Content-Type: multipart/mixed; boundary="7rrfBDNYWxCsUTfIlEAQpJA0RXEp0JiET";
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
Message-ID: <1fb53984-6b19-0db2-6ed7-60e1cb3fb817@suse.de>
Subject: Re: [PATCH v2 07/28] video: fbdev: sis: Fix defined but not used
 warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-8-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-8-sam@ravnborg.org>

--7rrfBDNYWxCsUTfIlEAQpJA0RXEp0JiET
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
> init.h define static symbols, so should only be included

s/define/defines
s/so should/so it should

> once. Drop the include from sis.h as it is not needed.
> This fixes a lot of warnings seen with a W=3D1 build.
>=20
> v2:
>    - Update subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Winischhofer <thomas@winischhofer.net>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/sis/sis.h | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/sis/sis.h b/drivers/video/fbdev/sis/si=
s.h
> index 9f4c3093ccb3..d632f096083b 100644
> --- a/drivers/video/fbdev/sis/sis.h
> +++ b/drivers/video/fbdev/sis/sis.h
> @@ -15,7 +15,6 @@
>  =20
>   #include "vgatypes.h"
>   #include "vstruct.h"
> -#include "init.h"
>  =20
>   #define VER_MAJOR		1
>   #define VER_MINOR		8
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--7rrfBDNYWxCsUTfIlEAQpJA0RXEp0JiET--

--HJIRrGsqj5PtOxbC0hRvnlo3IcQsYq2FP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/EtFUFAwAAAAAACgkQlh/E3EQov+Dd
xQ//Tb02a05Abzm3OJT3QY7MUyu9SvbEtm3Kf/Cn2pwPpOgLvJWRmAwmDMGElEcKI+/iLmLjcUpL
idW0ietgp7bTzhH6Fw/dNFBwB4w1MSLIdYQT14nkPI3ebFJDhbRojz12WT/C4CZH7xVduf7Z9C+o
HlswG5e9trVbZVoidTzxr8174pY2Q+S8jeHdjx+p6EEXpDX1Sa2GPKJHtGebiuiFgV+eGYDPc/a/
rp+CXKA0hdSx9HdM+p30ztQ4rjLQ6xZnN7nW7++MdX9HXwI8AhyyRPH3R2rEoYaO+8DOG04MgZol
oArd9k5juwn1Pu/kYE0gPhC8kyeEZiPHEwXMHW4hzXdnMHYP/tq8SQPrXXYbSweR6+R36kBp+F6P
lTrzqfjQZwttrW00ibrLQnFtagi6IsPfy5cplvrY1m+UxqghK8pVPhEJGoNa0JsCmbTSVqBRZuBM
kGtQwytGTkAAzUbeJK6Y/0j1vicyke7TP6lHP9AHNyQ02S1qN/4JXjchCWWV04BGCnNb+4ZqcfYn
X2UthQl9I+I4ldkBfx9P81kY5CrC9eS2g/VqkEwJwqxZgeH7/VDo7pzcQPaFfJpFzxuT891stj1+
xRBuNB7n0Z2xO21sIHLtIKZt8hNhnmribnhHRR6wVvqX7hLbAVpNOo83oG/VcSn70epWu2Txcheh
0LY=
=ZeOZ
-----END PGP SIGNATURE-----

--HJIRrGsqj5PtOxbC0hRvnlo3IcQsYq2FP--

--===============0398537862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0398537862==--
