Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9F93EF1BF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 20:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCA989E65;
	Tue, 17 Aug 2021 18:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC6889E65
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:22:33 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F46821FAF;
 Tue, 17 Aug 2021 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629224552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=592Le2NNIvfUfPQaModD+0yXTQ2wJpPTjpnad97qY4E=;
 b=ERYJSEpQSLVPRGZqkuo8kqCRy3IRqJ37kCS6po/gCe3KKIcsrJXp9NFsquig39lksoSUe1
 hf+7/Lhp8N4hynr2BehiSeKmoP1+72O8kyCKxBQsjDSNblDtTqJFFBPuhnSTDK4rdJTR6X
 ZXhb7E1uDijS6CMSQ7YIzriJ/y303hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629224552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=592Le2NNIvfUfPQaModD+0yXTQ2wJpPTjpnad97qY4E=;
 b=eNcIfmV3G1nw2UjGv+wniOJTMijL5gsj1YwpsIMth+syv29g1AbU9N38RPmqQEBeW58TxE
 HeMikag8tfkUC0Bw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C51BB136BF;
 Tue, 17 Aug 2021 18:22:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id EUvhLmf+G2G7fwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Aug 2021 18:22:31 +0000
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210817163204.494166-1-colin.king@canonical.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH][next] drm/mgag200: Fix uninitialized variable delta
Message-ID: <bc94e837-9b56-55ba-1e68-1cba79ac038a@suse.de>
Date: Tue, 17 Aug 2021 20:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210817163204.494166-1-colin.king@canonical.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X1xtbZPmJ37zC9vbH4rYBE4W1I3UPJVJ9"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X1xtbZPmJ37zC9vbH4rYBE4W1I3UPJVJ9
Content-Type: multipart/mixed; boundary="dZ23NRPhjOaTV5youl9bhpVXI7uEGEb9c";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <bc94e837-9b56-55ba-1e68-1cba79ac038a@suse.de>
Subject: Re: [PATCH][next] drm/mgag200: Fix uninitialized variable delta
References: <20210817163204.494166-1-colin.king@canonical.com>
In-Reply-To: <20210817163204.494166-1-colin.king@canonical.com>

--dZ23NRPhjOaTV5youl9bhpVXI7uEGEb9c
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.08.21 um 18:32 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable delta is not initialized and this will cause unexpected
> behaviour with the comparison of tmpdelta < delta. Fix this by setting
> it to 0xffffffff. This matches the behaviour as in the similar function=

> mgag200_pixpll_compute_g200se_04.
>=20
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 2545ac960364 ("drm/mgag200: Abstract pixel PLL via struct mgag20=
0_pll")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

But the commit message needs Fixes etc. I just sent out a patch for this =

issue myself. I'd like to merge both patches' tags and commit the result =

under your name. (You were first.) Is that ok for you?

Best regards
Thomas

> ---
>   drivers/gpu/drm/mgag200/mgag200_pll.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_pll.c b/drivers/gpu/drm/mg=
ag200/mgag200_pll.c
> index 7c903cf19c0d..18f1a6dd019a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_pll.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_pll.c
> @@ -125,6 +125,7 @@ static int mgag200_pixpll_compute_g200se_00(struct =
mgag200_pll *pixpll, long clo
>  =20
>   	m =3D n =3D p =3D s =3D 0;
>   	permitteddelta =3D clock * 5 / 1000;
> +	delta =3D 0xffffffff;
>  =20
>   	for (testp =3D 8; testp > 0; testp /=3D 2) {
>   		if (clock * testp > vcomax)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dZ23NRPhjOaTV5youl9bhpVXI7uEGEb9c--

--X1xtbZPmJ37zC9vbH4rYBE4W1I3UPJVJ9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEb/mcFAwAAAAAACgkQlh/E3EQov+DF
1RAAvJbQFxESitPZaG4A6dqm04TyJ1HRS/X4G3bze086dnX6DlaqL1zybmYtfl27rr07XADWcJmp
eOvnaP3hOUoG4LXbNDcR6nLa89Kuav8ZfpwsTypZJzj/QymxGmkE3PGVcPU5taKiM1jJW5Yn7A4H
fZkAN+ay6LfAfsKjcjpYl7FWt4vnewm3zQUPtlQp+ApnCqSXwKEPSf8Q8bbxxg6E0p4gXQw0BFTU
UXZRa/aqf4BmaMX84HSK4f3DYFPsHNpvDJykQ5VVakh95xc4dvfYMKAnNLzUdsXbEI8gu42AHp8i
U75Del97S3mjq46D7eJTBU3Y9Ywrp3kAnfuPdkR2og7fzBHzDQL9BU7/p7lJ5pKDr84ggkTswV7w
qvhJGLSawoAmfhBfhaeufV5Fu/O5tL1QEikcKnOuWBsDq1uYuhyfgQ0Ioq9EvOxBZLS+E/d89v3s
JUuq5rEeTiDHX1JtoMLlx8UeCKaJjskwUHcXCWYilNtzGiYjUm2l4KzpusaLiDKAqQsprAbuVpkc
DyEb7HHfzFnXEdAde9DCchjnN1u1TJAkNOUpFHMUOsU/3lGCOgo66Bcml9WaakGrFHwfqiZ2yeYe
JnudzAVdDtZQA1nqqvSDUOaKyn6St3Gb+M2AxPEUtLvH6Vak4nDPGclectl4HtziYdqmY95F+zrH
MlU=
=xus4
-----END PGP SIGNATURE-----

--X1xtbZPmJ37zC9vbH4rYBE4W1I3UPJVJ9--
