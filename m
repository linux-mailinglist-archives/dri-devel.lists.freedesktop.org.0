Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C85D3CB28B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 08:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A236E90E;
	Fri, 16 Jul 2021 06:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E86C6E90E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 06:29:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B0D322B2C;
 Fri, 16 Jul 2021 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626416988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3Y5jrP1Ajm9QGSDWNLBQxo3g/JY5NcuS7RdlMFsoaw=;
 b=17t1mZxgJbs1JrzsZE0acIpkK9U3F5b3SYwHnyfiJfnQOd7dUlnASvuRAGoU7n0Yt/GP8X
 Rl9Fmmkj6MoRjDq3nRipvtO1PMo79sm/cCswBBk+MTS4DEWVSZewVr3p2yczOtN6HOOGKD
 6DKYcDTVB/fYuj0+BSS7Y+CFIWR/F/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626416988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3Y5jrP1Ajm9QGSDWNLBQxo3g/JY5NcuS7RdlMFsoaw=;
 b=3hqXebwL/C7Uw13PJuD06xVfq73dTIJzfZkqS8A2hwQm1mVICv8Lh+tns+rRND3+HCNfad
 LDtGiFxM0DT0BoDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3C67313357;
 Fri, 16 Jul 2021 06:29:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id sslGDVwn8WBmQQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 06:29:48 +0000
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210716015615.9150-1-ainux.wang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Zero is missing in detect function
Message-ID: <aefcd1a7-fa2b-5342-58c0-314876c9bc32@suse.de>
Date: Fri, 16 Jul 2021 08:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716015615.9150-1-ainux.wang@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MC6HbLw4VEuwdOfiGJ9Lg6htf83LU9uno"
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
--MC6HbLw4VEuwdOfiGJ9Lg6htf83LU9uno
Content-Type: multipart/mixed; boundary="XFIEm7qxFIKjUwxXFwGgpdtX20C8IxvFh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sterlingteng@gmail.com,
 chenhuacai@kernel.org
Message-ID: <aefcd1a7-fa2b-5342-58c0-314876c9bc32@suse.de>
Subject: Re: [PATCH] drm/ast: Zero is missing in detect function
References: <20210716015615.9150-1-ainux.wang@gmail.com>
In-Reply-To: <20210716015615.9150-1-ainux.wang@gmail.com>

--XFIEm7qxFIKjUwxXFwGgpdtX20C8IxvFh
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

Thanks for caring.

I thought about the case of (r =3D=3D 0) when reviewing the patch that ad=
ded=20
it, but found it to be correct. If (r < 0) it's clearly an error and we=20
should return 'disconnected'. If (r =3D=3D 0), we were able to retrieve t=
he=20
EDID, but could not find any meaningful modes. Still, it's 'connected'.

Unless there is a concrete bug where the status is mis-detected, I think =

that the current code is correct.

Best regards
Thomas

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


--XFIEm7qxFIKjUwxXFwGgpdtX20C8IxvFh--

--MC6HbLw4VEuwdOfiGJ9Lg6htf83LU9uno
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDxJ1sFAwAAAAAACgkQlh/E3EQov+DY
Qw//ejR6llp+imlH+GOFCrJcqo8RXpAfQsXqlISe4E5FAbyFNOhP8xtgdReBhfhsuYpPAKux8a4P
11rg9xiNJC0p3SF4eAiugTikfudJo1mlbFzNjAMLQHWqYXS/rU7Uz3wszSwKAF7kwp3S0s+l1ebi
6oJOZMPgxp3N2pd7ul50yEUeC0aTY7BYbdJTS9+DvOKnQxpGD/7Gu07KaYZ/sZ3k6RShwnaemZXT
aN+5LM10ElRW+xiqlLvv9XExCwYWiZ9lsovBFaaSOPirD5XM484jpO8GQ0CETwfIJc3JRmLSc6OY
pKUKfW3v0oHA2f1lUuA2agBKRxlHPmChCS1qlNJyq2+NNg3ipyQiU0vtfjXoo9MJJxvzzDOswNqw
QWtj0ZWOWcyJW2+t/CD++q4tdD5R2YGmT1SGbX7TjkV0Gm5r/FwhNyJ9VqeR1MRqHWRp18hOCGA/
7JVISONJMXaJNeJCxF4xA1BY51isL0YI/WYocHs7NwchkSMhYYuN2RC0S844lfwS4lV1hU4+eWAy
frw4jfytaAUNgsXp0I4vWu/Cm4sm+d5wKGO21CQnD+DuoqEdNecjOahri/47z+zFtJY2x7YQOW3j
scyjcR9SkP4bA/YDZYZMCfCgXFW+sUbgD50mn2oqB8Dmc79wcxKbqAcJtX1SWDnR0wBLIksoYvQb
CKQ=
=oIRY
-----END PGP SIGNATURE-----

--MC6HbLw4VEuwdOfiGJ9Lg6htf83LU9uno--
