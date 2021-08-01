Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269573DCBBE
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 15:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEF86E053;
	Sun,  1 Aug 2021 13:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA9F6E053
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 13:14:11 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6186C1FEDB;
 Sun,  1 Aug 2021 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627823649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVbGi8MRm8eKRuq6mt+aJUbM29zUwHEleLBUsRyqnmM=;
 b=o0zsmbA8rRbsEL7S1EmGarxqH3qRaSHKda9aYvdFFzF7qwpKFTwIHN0DEoSwN3UJ8ckH+U
 iAyEqP437AiJ5BjKiSlooNu+g0GQokvBl4SToROwkS19iydo6iYaguLR+qTaCIPT6fy72X
 yVrgBxTR7w6cItbovTsTGVksfrFF0JA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627823649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVbGi8MRm8eKRuq6mt+aJUbM29zUwHEleLBUsRyqnmM=;
 b=IaEmCCwzYIv0eRabqSsKoOtVc2lRIHSeEWsY/HQWWEej3tef9UmDpj/9RcsFfIgQ/CyVwD
 HjCgQu9uTwy9LrAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 36CD81369B;
 Sun,  1 Aug 2021 13:14:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id U/FRCyGeBmHESAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Sun, 01 Aug 2021 13:14:09 +0000
Subject: Re: [PATCH] DRM: ast: Fixed coding style issues of ast_mode.c
To: Gregory Williams <gregwills85@gmail.com>, airlied@redhat.com
Cc: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20210731005328.GA19016@devbox>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b691ab82-31fd-668c-74c0-5210a8c07b64@suse.de>
Date: Sun, 1 Aug 2021 15:14:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210731005328.GA19016@devbox>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tP1HlnhQ9LuKF8wn5l6xncL1gJmAIJDKK"
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
--tP1HlnhQ9LuKF8wn5l6xncL1gJmAIJDKK
Content-Type: multipart/mixed; boundary="NfxQJhVwm57dX8P2l3lYToo6EmjRtkhtF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gregory Williams <gregwills85@gmail.com>, airlied@redhat.com
Cc: daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Message-ID: <b691ab82-31fd-668c-74c0-5210a8c07b64@suse.de>
Subject: Re: [PATCH] DRM: ast: Fixed coding style issues of ast_mode.c
References: <20210731005328.GA19016@devbox>
In-Reply-To: <20210731005328.GA19016@devbox>

--NfxQJhVwm57dX8P2l3lYToo6EmjRtkhtF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 31.07.21 um 02:53 schrieb Gregory Williams:
> Removed space before comma, fixed if statements by putting trailing
> statements on new line, fixed unsigned int declaration, and removed
> not needed else statement after return.
>=20
> Signed-off-by: Gregory Williams <gregwills85@gmail.com>

Added to drm-misc-next. Thanks for the patch.

Best regards
Thomas

> ---
>   drivers/gpu/drm/ast/ast_mode.c | 31 ++++++++++++++++++++-----------
>   1 file changed, 20 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 36d9575aa27b..1310ed092073 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -275,7 +275,7 @@ static void ast_set_std_reg(struct ast_private *ast=
,
>   	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x01, 0xdf, stdtable->s=
eq[0]);
>   	for (i =3D 1; i < 4; i++) {
>   		jreg =3D stdtable->seq[i];
> -		ast_set_index_reg(ast, AST_IO_SEQ_PORT, (i + 1) , jreg);
> +		ast_set_index_reg(ast, AST_IO_SEQ_PORT, (i + 1), jreg);
>   	}
>  =20
>   	/* Set CRTC; except base address and offset */
> @@ -498,13 +498,15 @@ static void ast_set_sync_reg(struct ast_private *=
ast,
>  =20
>   	jreg  =3D ast_io_read8(ast, AST_IO_MISC_PORT_READ);
>   	jreg &=3D ~0xC0;
> -	if (vbios_mode->enh_table->flags & NVSync) jreg |=3D 0x80;
> -	if (vbios_mode->enh_table->flags & NHSync) jreg |=3D 0x40;
> +	if (vbios_mode->enh_table->flags & NVSync)
> +		jreg |=3D 0x80;
> +	if (vbios_mode->enh_table->flags & NHSync)
> +		jreg |=3D 0x40;
>   	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, jreg);
>   }
>  =20
>   static void ast_set_start_address_crt1(struct ast_private *ast,
> -				       unsigned offset)
> +				       unsigned int offset)
>   {
>   	u32 addr;
>  =20
> @@ -1212,6 +1214,7 @@ static int ast_get_modes(struct drm_connector *co=
nnector)
>   	struct edid *edid;
>   	int ret;
>   	bool flags =3D false;
> +
>   	if (ast->tx_chip_type =3D=3D AST_TX_DP501) {
>   		ast->dp501_maxclk =3D 0xff;
>   		edid =3D kmalloc(128, GFP_KERNEL);
> @@ -1231,8 +1234,8 @@ static int ast_get_modes(struct drm_connector *co=
nnector)
>   		ret =3D drm_add_edid_modes(connector, edid);
>   		kfree(edid);
>   		return ret;
> -	} else
> -		drm_connector_update_edid_property(&ast_connector->base, NULL);
> +	}
> +	drm_connector_update_edid_property(&ast_connector->base, NULL);
>   	return 0;
>   }
>  =20
> @@ -1272,19 +1275,24 @@ static enum drm_mode_status ast_mode_valid(stru=
ct drm_connector *connector,
>   	}
>   	switch (mode->hdisplay) {
>   	case 640:
> -		if (mode->vdisplay =3D=3D 480) flags =3D MODE_OK;
> +		if (mode->vdisplay =3D=3D 480)
> +			flags =3D MODE_OK;
>   		break;
>   	case 800:
> -		if (mode->vdisplay =3D=3D 600) flags =3D MODE_OK;
> +		if (mode->vdisplay =3D=3D 600)
> +			flags =3D MODE_OK;
>   		break;
>   	case 1024:
> -		if (mode->vdisplay =3D=3D 768) flags =3D MODE_OK;
> +		if (mode->vdisplay =3D=3D 768)
> +			flags =3D MODE_OK;
>   		break;
>   	case 1280:
> -		if (mode->vdisplay =3D=3D 1024) flags =3D MODE_OK;
> +		if (mode->vdisplay =3D=3D 1024)
> +			flags =3D MODE_OK;
>   		break;
>   	case 1600:
> -		if (mode->vdisplay =3D=3D 1200) flags =3D MODE_OK;
> +		if (mode->vdisplay =3D=3D 1200)
> +			flags =3D MODE_OK;
>   		break;
>   	default:
>   		return flags;
> @@ -1296,6 +1304,7 @@ static enum drm_mode_status ast_mode_valid(struct=
 drm_connector *connector,
>   static void ast_connector_destroy(struct drm_connector *connector)
>   {
>   	struct ast_connector *ast_connector =3D to_ast_connector(connector);=

> +
>   	ast_i2c_destroy(ast_connector->i2c);
>   	drm_connector_cleanup(connector);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NfxQJhVwm57dX8P2l3lYToo6EmjRtkhtF--

--tP1HlnhQ9LuKF8wn5l6xncL1gJmAIJDKK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEGniAFAwAAAAAACgkQlh/E3EQov+Ck
GQ/8CgwtCvs10lFGfFhj9VkV5tQR+OT9Ip2o+Crw2ZJR80QgiyE5BYadzEcffrBxNKTxeq20pfCP
sCH4eeD0SS0C4On9WQu8iPlMz5GVVFKjkC4/+FSzZgLgpFx8hQOYR4PM7mIBJ29gNrRjdcMyUIw0
vnAv5XXTHbH8iEOHyAZdAFKVzh+Scazx9LOW1DjRTHnHAj502dniGwCkug49TmQ0k9kdU7nmbgIW
gB1Ck/olvskO8pmUJJL+EAdRygbxLeawLTDpodl3NL+XjXLx6bwL9xYsQD6oPMblm/3icpxJNMKd
pgn/SS/j2UxBrIM2oZ8p26xArUNu9+96Q/vBtUrU/t/saCOqNvX5ZcVp0X9JbbJWO6Ui2L5SDrkY
VFWFcS6ktCAbkjVjbKpESmAq68wBQsd/BNIqAlw889ielkF908QK50HVq/UwfqGKSpP9nLnRJDbA
KTNOJ9PgFoHv08welLS5DMtQzQdmD9dt3OtXuyTd+JwZ5tRoqZ5VQKHj92+7PUrl1gRaQeJCk6fY
11XgSk3g7vkMjliGlQBKmGPaqAWXvlzAwxIT6tOmNbbNBP32kJGZZTYP54GXQ9gQSEpY1dVxd1dt
yidtGiBbD0208FSwiXX+vBJSxwCnJDTvyDiwxpX7k0zw5it/XLzAJTntW5hAo14bVuC9vhhedanP
0DI=
=LUfM
-----END PGP SIGNATURE-----

--tP1HlnhQ9LuKF8wn5l6xncL1gJmAIJDKK--
