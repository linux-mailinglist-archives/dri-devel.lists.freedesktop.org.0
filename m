Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415F33CF664
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DF16E09A;
	Tue, 20 Jul 2021 08:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494836E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 08:57:31 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02BF71FDDC;
 Tue, 20 Jul 2021 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626771450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZXNnH6D1Q32/FJ1I4xXSlZSda7tbLPV20AyNdNWH554=;
 b=ripcJOAob/isB17J5mrJMngv5wZ2R0BNMzFnSVeJtHDvOQ/n4P4IqpL7n8w+1z6+Dcmqhj
 JsiPFnUZ2f+jyqIOoAZOMCnPyud8Kt9sJ6frlZRnc5um4dnH8hFNLiQ/Ol8Da1wWj4D4CW
 QC7EBUFQI1fKkfcRAbVesSEMtBwsA+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626771450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZXNnH6D1Q32/FJ1I4xXSlZSda7tbLPV20AyNdNWH554=;
 b=Xq/r2Ym8/l5nTKGsZPim+oElzrhM+XwQMDePpRyNuby8CWfs4eXzdxqIGrLu487g72tQhb
 TCg6hhlcprXMJgBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CEB0913A2E;
 Tue, 20 Jul 2021 08:57:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id zsduMfmP9mABEwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jul 2021 08:57:29 +0000
Subject: Re: [PATCH] drm/ast: Zero is missing in detect function
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210716015615.9150-1-ainux.wang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <81a3d5e6-7998-b839-9303-c7759eb86907@suse.de>
Date: Tue, 20 Jul 2021 10:57:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716015615.9150-1-ainux.wang@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="643VSKineCFUNxtt919Xxt5YhEyWpbGXz"
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
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--643VSKineCFUNxtt919Xxt5YhEyWpbGXz
Content-Type: multipart/mixed; boundary="ZPumEoFlbOXT7VFWQdcMdwph6HYuYU2bw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sterlingteng@gmail.com,
 chenhuacai@kernel.org
Message-ID: <81a3d5e6-7998-b839-9303-c7759eb86907@suse.de>
Subject: Re: [PATCH] drm/ast: Zero is missing in detect function
References: <20210716015615.9150-1-ainux.wang@gmail.com>
In-Reply-To: <20210716015615.9150-1-ainux.wang@gmail.com>

--ZPumEoFlbOXT7VFWQdcMdwph6HYuYU2bw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.07.21 um 03:56 schrieb ainux.wang@gmail.com:
> From: "Ainux.Wang" <ainux.wang@gmail.com>
>=20
> The function ast_get_modes() will also return 0, when it try to get the=

> edid, but it also do not get the edid.
>=20
> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

after the issue has been discussed a bit. I'll merge the patch into=20
drm-misc-next soon.

Best regards
Thomas

> ---
>   drivers/gpu/drm/ast/ast_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index e5996ae03c49..b7dcf7821ec6 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1299,7 +1299,7 @@ static enum drm_connector_status ast_connector_de=
tect(struct drm_connector
>   	int r;
>  =20
>   	r =3D ast_get_modes(connector);
> -	if (r < 0)
> +	if (r <=3D 0)
>   		return connector_status_disconnected;
>  =20
>   	return connector_status_connected;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZPumEoFlbOXT7VFWQdcMdwph6HYuYU2bw--

--643VSKineCFUNxtt919Xxt5YhEyWpbGXz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmD2j/kFAwAAAAAACgkQlh/E3EQov+A8
rQ//esrncfgqyM9hFmFhbFxmpEqO9cods184rjfYzA0z1pYJiJcLk7f3Ty802IbGdLQFMHmAE0R4
qKNb3a0BS7mSiM3ompMlxbcQi6JtCmobpg6bcQPn/GUPP2WnAZCuVueRJ7VXQKoXc0wlfJ5E3K50
A6uhPihY56N3jxWk2kaVsCIiwGbkEMORswK2YKujvLisn8i3pmZZtHS65rDk+Da3S/XpWH23Ib4f
k1Ye3S8iKunD48kUQ5KdWdLsYyHEgAyf/j8goZTvPImwEFu08DQ5mbQuN55Y5hKUJIALKdj4jdAy
ri+162Lonr15tbFT4e8iFbnFZIbktG27LnRwlUZIbD/nJcu+Nm3+TOnMsGFe180FPIxL45PzaUt8
5KLiX9TEvs946eN/o9Dtwf7398Nz+rNFs/nurY2AT5hzJ+VoZDN52OMti/1z52TCAdP51KZ0SCcO
wBPcXRnLugryK27V+hlTj5ImgRaUfcGvVGGNBtFBbB0PVoXgiWfGNp6uO1EA41U1wtirr1I4iKvC
ZCxZzn9QVlO2qXu2IshM6/8JNum7/GHwqFWHR6JDJ6IGhG1RiTH7vv0MDdvqjkFDJBk6o30WMm2z
2Kle2xEt3Dg66lUSns5k9KqtuJz4uzJFISX8jyF/ZG0t75LP05trv0dWH6QpiPJ6MdLsDJy4gki+
xFY=
=D5Pp
-----END PGP SIGNATURE-----

--643VSKineCFUNxtt919Xxt5YhEyWpbGXz--
