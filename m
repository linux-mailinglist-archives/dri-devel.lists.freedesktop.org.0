Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB833920EC
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60EC6E83D;
	Wed, 26 May 2021 19:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815C96E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:33:00 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2220D1FD2A;
 Wed, 26 May 2021 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622057579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnKoLQ9wdrpqMlILXZXaccGxyHEJ08JoRUS4Y1cY7TY=;
 b=F71eGL41aGRy6VGBnPaLriWrylB4kACYlYLUWrLanab0ea8TtyALa4rucBXWPtMgcns4nC
 ol68lj7oEQG++xHjT0MItQGcmKj2ROYLY1fCfANKxQyG8ELxv1oIWbVwL46Y658bLvsV6w
 3JjKDpuJZeAbk3/+5z1imRx1WGsW4H8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622057579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XnKoLQ9wdrpqMlILXZXaccGxyHEJ08JoRUS4Y1cY7TY=;
 b=Pg57YpSDGXoZfOdIkD8AAt3MjogHUVm379lxaFwOsoZ4ysThdrV4yR4cd+9PENYiJFdcEV
 eQ3VTdYLC5Y1vlAw==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id D896B11A98;
 Wed, 26 May 2021 19:32:58 +0000 (UTC)
Subject: Re: [PATCH] fbdev: matrox: use modern module_init()
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210514213316.635070-1-arnd@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f92da893-99fd-e666-c033-2a0dfda91af0@suse.de>
Date: Wed, 26 May 2021 21:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210514213316.635070-1-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KjYTvGArAJW9dIAx3SZMsHc6xqgxm4dmw"
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KjYTvGArAJW9dIAx3SZMsHc6xqgxm4dmw
Content-Type: multipart/mixed; boundary="VCDtghEHKrr9enattwxa4kCZWpmLROarj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Message-ID: <f92da893-99fd-e666-c033-2a0dfda91af0@suse.de>
Subject: Re: [PATCH] fbdev: matrox: use modern module_init()
References: <20210514213316.635070-1-arnd@kernel.org>
In-Reply-To: <20210514213316.635070-1-arnd@kernel.org>

--VCDtghEHKrr9enattwxa4kCZWpmLROarj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 14.05.21 um 23:33 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This is one of the last drivers with a global init_module() function
> instead of the modern module_init() annotation. Convert it over.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Added to drm-misc-next. Thank you.

Best regards
Thomas

> ---
>   drivers/video/fbdev/matrox/matroxfb_base.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video=
/fbdev/matrox/matroxfb_base.c
> index 4325bf7f388c..5c82611e93d9 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_base.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_base.c
> @@ -2486,8 +2486,6 @@ static int __init matroxfb_init(void)
>   	return err;
>   }
>  =20
> -module_init(matroxfb_init);
> -
>   #else
>  =20
>   /* *************************** init module code *********************=
******* */
> @@ -2572,7 +2570,7 @@ module_param_named(cmode, default_cmode, int, 0);=

>   MODULE_PARM_DESC(cmode, "Specify the video depth that should be used =
(8bit default)");
>   #endif
>  =20
> -int __init init_module(void){
> +static int __init matroxfb_init(void){
>  =20
>   	DBG(__func__)
>  =20
> @@ -2603,6 +2601,7 @@ int __init init_module(void){
>   }
>   #endif	/* MODULE */
>  =20
> +module_init(matroxfb_init);
>   module_exit(matrox_done);
>   EXPORT_SYMBOL(matroxfb_register_driver);
>   EXPORT_SYMBOL(matroxfb_unregister_driver);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VCDtghEHKrr9enattwxa4kCZWpmLROarj--

--KjYTvGArAJW9dIAx3SZMsHc6xqgxm4dmw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCuomoFAwAAAAAACgkQlh/E3EQov+DP
jBAAxh7FsZU/GHlQYV1R/8+f9sRJEVnK7bu0uj0uKHwt589HGsLi5zFO44WZQzUGW7WybD39bnAY
q6N8iWPEvEPG2qrGOme1PMRr5cnELkUBedyMm0u905LkV73bLk/eNfUw+3ZoxqQYqvHq841UKsae
hZkLEbUlsUYjhZVuSepGxhLLR9dglpsqYQAKnJyP9RsBXQrJvnz42EgDIDM0ncOfYefckGppkMrZ
/218n85y7buLTWLGji7dbudu5Rerf0LKBNTkhJMlMSTunzP6/UgVTHQe1tZIla0oMDkaT5BSz3so
0wwE5YbPtMcIAa+dAZKPO01NbFRIoZlEz8+d7bY7e5g7Ffl/f407jDUaI1wuc2/QHrByuu+rxS95
UDS7Hh8VjL2xjx8rAD2AS1RvVkZPOtc9ZfXq3FS0/5BaNtNngC1aSq+TM0eGXofVJHwyrSXE9Zfh
S1QSN1Uqv3A7vJQC5qPxu2V4Yz344bTxKSqsz6jD0Y+vp4hk7EXYG0ugZxxXgjVT8zE0NhO/ICp7
CPlc3I5HF/IRtnh2FFGJI9bzV6BKfE+BSp/VtOjhgp5KxZmwG+W3pYLr5eUBzUXVHQcP5UEeQBuO
L2vZPkuaum52joyu0DN5xZI/IE8Ktk9b42FG5pD8YDMdBIWsrGQB+ZmIo8aaYD+h3dzPg2kkiIo1
Tdc=
=ZCQi
-----END PGP SIGNATURE-----

--KjYTvGArAJW9dIAx3SZMsHc6xqgxm4dmw--
