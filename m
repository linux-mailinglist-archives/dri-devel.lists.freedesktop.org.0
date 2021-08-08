Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFB3E3C1C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 19:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7F89AA2;
	Sun,  8 Aug 2021 17:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F029B89AA2
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 17:58:02 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4365E21D07;
 Sun,  8 Aug 2021 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628445481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V/9kiO+9WhmK5mV+0wLk7T1opvEIZMMIGiktQ2bm4Pg=;
 b=xD+bwtyOW4/8DqIajJnbbCahafUKQDRWcRrpZr79NCx2WjGrl3VbnuKjTPcRBRzF328Vz5
 6u/b8/xUr61cXi4GFoWdKlAysycvjClDDb2t8PkjWTF9AajPjJzDWU7xDeGnlQfCk7IKVl
 2DC7/lusXQOFeNjslK157VMZAIvuti0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628445481;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V/9kiO+9WhmK5mV+0wLk7T1opvEIZMMIGiktQ2bm4Pg=;
 b=MX26sCcEzAenXqpgq3UYrq/kw0aka5Vvtbh4cSbVOEVFGq1YfjLTb6DL8THlSOMuwJ4YNv
 kyigzbiLZ00lcLAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D471E133DE;
 Sun,  8 Aug 2021 17:58:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 80v1MSgbEGHvMQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Sun, 08 Aug 2021 17:58:00 +0000
Subject: Re: [PATCH 1/8] drm/ingenic: Remove dead code
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-2-paul@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ff06e53b-ba7e-5535-8931-ce7f7cdae5a6@suse.de>
Date: Sun, 8 Aug 2021 19:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210808134526.119198-2-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VOzPDVQf7fa4MlJHToh9YUEL4fONcpvAm"
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
--VOzPDVQf7fa4MlJHToh9YUEL4fONcpvAm
Content-Type: multipart/mixed; boundary="LZxk0qyEy2wbROb0ogb8MA7MlEdNsLpsP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <ff06e53b-ba7e-5535-8931-ce7f7cdae5a6@suse.de>
Subject: Re: [PATCH 1/8] drm/ingenic: Remove dead code
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-2-paul@crapouillou.net>
In-Reply-To: <20210808134526.119198-2-paul@crapouillou.net>

--LZxk0qyEy2wbROb0ogb8MA7MlEdNsLpsP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 08.08.21 um 15:45 schrieb Paul Cercueil:
> The priv->ipu_plane would get a different value further down the code,
> without the first assigned value being read first; so the first
> assignation can be dropped.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 ---
>   1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index d261f7a03b18..e42eb43d8020 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -984,9 +984,6 @@ static int ingenic_drm_bind(struct device *dev, boo=
l has_components)
>   	priv->dma_hwdescs->hwdesc_pal.cmd =3D JZ_LCD_CMD_ENABLE_PAL
>   		| (sizeof(priv->dma_hwdescs->palette) / 4);
>  =20
> -	if (soc_info->has_osd)
> -		priv->ipu_plane =3D drm_plane_from_index(drm, 0);
> -
>   	primary =3D priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
>  =20
>   	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LZxk0qyEy2wbROb0ogb8MA7MlEdNsLpsP--

--VOzPDVQf7fa4MlJHToh9YUEL4fONcpvAm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEQGygFAwAAAAAACgkQlh/E3EQov+BQ
Bg//e+OwVtfgvrGkkr9GVLezFOd/elkuwdraBVrJuGPZrkK6HtzVOa1dJQ0eU+cl8yJqaCgXHb3p
ps8/fIcnIToel2dhjvKAf020uvabY8u2h35ObyaJbOEVEmDJSLF83s+QQPWGBDAicX96s6qll99/
bJSjYMyoCrwe474nWKWc1Zjydj3F79KjPKdfteMyZsyGUtUL/KGUXqeckwoy6wsDD96IHXtABPXh
uMiMNxmaZ8ipf0Dik+f2pzrY4fuoWn9egwoZZ3N/C10ihPyiOIL9/RV+xJXoFPyRc5Gny5GsNiNm
eoSpFy24rqYoUIR3a0L3s192iESLiWddNUENnXkBZ5183WyM5zWV/iIrgbRphTTsv5I0YZoDDKEA
ewQZvpRaxY17FtbjnfSQNvXH5oDXahU+9RWUS9Iw/OsTFk3NUgXpyIDyJlTCqvvE6DyftBKChIek
2VlcFNKh93Fo8U83PYvlpGkSwjZZioA/KXmNgRsWk1aQYXlTwoJQVGaD1vBUn7x4wiGt2jiXGA32
q++0+oyoNRxXRCHBRpQCOUiiZkYq8PbYwW3cI4zNgDsZYupkzEogvlHa0hwNDVUVU0nTD5c7g+tO
4sAwloR3Oczf8ozMbDnmJ9A5WR0CHDhuxCGEfrLN26PM+rFgwWxm8IbCujoivcidAS/9vyVIyFOL
eQE=
=foVq
-----END PGP SIGNATURE-----

--VOzPDVQf7fa4MlJHToh9YUEL4fONcpvAm--
