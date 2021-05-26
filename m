Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297F3920B3
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818616E5BE;
	Wed, 26 May 2021 19:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598116E5BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:15:34 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB189218D6;
 Wed, 26 May 2021 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622056532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J0S2BwyIqYEga9mNycDkRMKsICp8l83R0rlfpwuvIvk=;
 b=XJ/8LNhcH2rqCnzzIvFrK1fVBRJHK5ZhpW5iteOZDHAp1Lru4lwcIJlSKL8111wkWWHn33
 H1moIz9ABDTvA4NbeYC1eJl3nFeAO7PC+PFoKMQQJEaQiJ0HuMbgqnuEOXr0/5X3ZRcj57
 vBFHHS5EiKzB0WSyb6cglegKFSJn/LY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622056532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J0S2BwyIqYEga9mNycDkRMKsICp8l83R0rlfpwuvIvk=;
 b=bIaXBsjCQ/ymrqizBNpFU3rX+jd2fc2dWVZ649q4JqXgKh8z4TIbQfSL+iQ6Zcoa1lT+Kz
 XjJNaWkzWn/HBvCg==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id BC60D11A98;
 Wed, 26 May 2021 19:15:32 +0000 (UTC)
Subject: Re: [PATCH v2] drm/ast: Add detect function support
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210526111515.40015-1-ainux.wang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <899588fd-1387-9afd-c34b-95e8a9126612@suse.de>
Date: Wed, 26 May 2021 21:15:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526111515.40015-1-ainux.wang@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uT4LudKtvkSRpCQkczwhofuW9ylOawMF5"
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
--uT4LudKtvkSRpCQkczwhofuW9ylOawMF5
Content-Type: multipart/mixed; boundary="7tu7x0BVvnWc5Hev0NguYPEWOuWfzDetM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ainux.wang@gmail.com, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <899588fd-1387-9afd-c34b-95e8a9126612@suse.de>
Subject: Re: [PATCH v2] drm/ast: Add detect function support
References: <20210526111515.40015-1-ainux.wang@gmail.com>
In-Reply-To: <20210526111515.40015-1-ainux.wang@gmail.com>

--7tu7x0BVvnWc5Hev0NguYPEWOuWfzDetM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.05.21 um 13:15 schrieb ainux.wang@gmail.com:
> From: Ainux <ainux.wang@gmail.com>
>=20
> The existence of the connector cannot be detected,
> so add the detect function to support.
>=20
> Signed-off-by: Ainux <ainux.wang@gmail.com>

Looks good. If no one else comments, I'll merge the patch soon. Thanks a =

lot.

Best regards
Thomas

> ---
>   drivers/gpu/drm/ast/ast_mode.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 36d9575aa27b..e5996ae03c49 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1293,6 +1293,18 @@ static enum drm_mode_status ast_mode_valid(struc=
t drm_connector *connector,
>   	return flags;
>   }
>  =20
> +static enum drm_connector_status ast_connector_detect(struct drm_conne=
ctor
> +						   *connector, bool force)
> +{
> +	int r;
> +
> +	r =3D ast_get_modes(connector);
> +	if (r < 0)
> +		return connector_status_disconnected;
> +
> +	return connector_status_connected;
> +}
> +
>   static void ast_connector_destroy(struct drm_connector *connector)
>   {
>   	struct ast_connector *ast_connector =3D to_ast_connector(connector);=

> @@ -1307,6 +1319,7 @@ static const struct drm_connector_helper_funcs as=
t_connector_helper_funcs =3D {
>  =20
>   static const struct drm_connector_funcs ast_connector_funcs =3D {
>   	.reset =3D drm_atomic_helper_connector_reset,
> +	.detect =3D ast_connector_detect,
>   	.fill_modes =3D drm_helper_probe_single_connector_modes,
>   	.destroy =3D ast_connector_destroy,
>   	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_st=
ate,
> @@ -1334,7 +1347,8 @@ static int ast_connector_init(struct drm_device *=
dev)
>   	connector->interlace_allowed =3D 0;
>   	connector->doublescan_allowed =3D 0;
>  =20
> -	connector->polled =3D DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> +						DRM_CONNECTOR_POLL_DISCONNECT;
>  =20
>   	drm_connector_attach_encoder(connector, encoder);
>  =20
> @@ -1403,6 +1417,8 @@ int ast_mode_config_init(struct ast_private *ast)=

>  =20
>   	drm_mode_config_reset(dev);
>  =20
> +	drm_kms_helper_poll_init(dev);
> +
>   	return 0;
>   }
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--7tu7x0BVvnWc5Hev0NguYPEWOuWfzDetM--

--uT4LudKtvkSRpCQkczwhofuW9ylOawMF5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCunlQFAwAAAAAACgkQlh/E3EQov+D7
FBAAsg/42Q6ic63iKciRXVTvdai4ZC1c2blr37psoTeY0i3wM5c6BhJpv+0VlPblSN7rhqfZ4XI7
Vb1glJbws29OhOQhDK9RRsdreiMW6EB0ZDKwUdFcjoG+N03WFmCglX8DoEsy2A1s+3aQDQrWUNV8
E38AAEqyQvu4QlMho5Ck765XenDknweIo9sdI0tRaD+X+bBxEqjuZtjQPoNYb9IOrUQeIZOg8UdB
7ngJYynOLmC8MHItfeWlO8uqkEd+jIEmVs0gouA78fOmytkqO3+cpWDODvODFXmhwp15fObv8sKQ
vvATk78/X+fRYd4SFzHoPyKBPH4pFkuMnOmLjnRcrXswYV2MDuc/Dbnx4zgDt5SNNsBj4W6zDkND
mzCM39H7plwhYUyaCJetjXH1Bbpr98H/i4v/CLzCn+AgAlBf80OiqZRDz2iEbk6q0mOEn0ieb5oW
rWw0mhi98y/CYUHoY2ZZ/l63jY/IHEF7b0PcaMixy6vHB+KRtDsTt2+lzVhLZUH1QCRk/xvWeNRT
oHYCY3gUZeRe7BXezpfYLEmr5PsUDIPdLm7FgW14twZboq3bZJl5BB4BKksQtuw+FEya0PYkeOhq
dyit+m1Cy3nmCLrlXEDCEE/GhwolsIKact7Qbxh5ZRmYgQJZqO5uQoOxH81lS8Qhrd0+e9ecQU7X
J30=
=hwsW
-----END PGP SIGNATURE-----

--uT4LudKtvkSRpCQkczwhofuW9ylOawMF5--
