Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5298A53BC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CB5112610;
	Mon, 15 Apr 2024 14:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="miCsmSe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4511260D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:30:32 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6ee13f19e7eso2282404b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713191432; x=1713796232; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OxkgnUs+kBMGiJuwP3wApGOJHNIKCPg1iHNxfXmCeQ8=;
 b=miCsmSe99LM4Xnj/EIO/KZImfVzObzNYtpTPS6g+7AAUq6KCvyLO2vpOrtYi5NCFiO
 4G6PZkyHFclLJpErDykghozV3e18GWFyidVw+rRW9bjfGrxq/SghwwRy8+xquUuwTEko
 tAiszUiF26dRQe8Wo2KB/mov7ngdwSI5TndJ5KGahlmS5rKi6VGXN3pFTmGzGm1vlGFp
 dh7y0hA5jm71o5nLiKRcfbtoELmqNcTdmT6DWCJh7AJakZNxBZzBC6AYhy+cKsPV8jip
 Ranx4XFYmGPiRaW0zxEYrmSiNa9XmqW5w6iNWT34AOZL47N09+eQ3xVqsmAMM7kkbdPC
 qdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713191432; x=1713796232;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OxkgnUs+kBMGiJuwP3wApGOJHNIKCPg1iHNxfXmCeQ8=;
 b=in1zU+qPG6nYFTM1AorUc4wCRN329j+6/qw+PMC30TQsDko2F2lg03kyCHdgx2GJU/
 OsUdgX8fQEvHe7Xv/aIxF2fRRHqLFWNoEX58kiXJEXdCoMFSjzV/4PsdDmZwNHziJCuu
 LijI21U9HD5IdUEaoyjgyStDOrgtQehI8YJyMT+dq0OZD33flPitHINLfqbW0LhW6612
 XVQAq7tk9lPXmIsxuHSouiOZXTd0K/Z/W4xfc3J4DdfT6WLRuMvftXkOx7bR42J6mvEp
 SW09ItB7EkCHXyTxqhbt4jvKVzp39WzoBvIklmZ82+TzaDtjeDIZQsSho+wvLbeZvk2F
 ziCw==
X-Gm-Message-State: AOJu0Yw9idS4sClAfI6O7sA9v9zO9dM3HFa7oRLcudGybVRYaeWVsBNd
 12W6OLGFUzKuBQKQ7LV3l0pHYTbXB86dZj/uqzRflqMOMK4mtE87
X-Google-Smtp-Source: AGHT+IEqcAqUqtYh/KP0MdkXTBsdUaAq3tHbRzSrrLSYR8NONpFCq0LMvNa0Lrr1mOr33eSJRtzz6g==
X-Received: by 2002:a05:6a00:22c2:b0:6ed:def7:6acb with SMTP id
 f2-20020a056a0022c200b006eddef76acbmr11091850pfj.14.1713191431494; 
 Mon, 15 Apr 2024 07:30:31 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 y21-20020aa78055000000b006ecfc3a5f2dsm7257230pfm.46.2024.04.15.07.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 07:30:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id B36CA1846908B; Mon, 15 Apr 2024 21:30:26 +0700 (WIB)
Date: Mon, 15 Apr 2024 21:30:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 1/3] drm: drm_blend.c: Add precision in
 drm_rotation_simplify kernel doc
Message-ID: <Zh06AuQ80Zm6LqXw@archie.me>
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-1-033d55cc8250@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Nd2Ooc566udnyVEp"
Content-Disposition: inline
In-Reply-To: <20240409-google-drm-doc-v1-1-033d55cc8250@bootlin.com>
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


--Nd2Ooc566udnyVEp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2024 at 12:04:05PM +0200, Louis Chauvet wrote:
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..8d4b317eb9d7 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -321,6 +321,11 @@ EXPORT_SYMBOL(drm_plane_create_rotation_property);
>   * transforms the hardware supports, this function may not
>   * be able to produce a supported transform, so the caller should
>   * check the result afterwards.
> + *
> + * If the rotation is not fully supported, this function will add a rota=
tion of 180
> + * (ROTATE_90 would become ROTATE_270) and add a reflection on X and Y.
> + * The resulting transformation is the same (REFLECT_X | REFLECT_Y | ROT=
ATE_180
> + * is a no-op), but some unsupported flags are removed.
>   */
>  unsigned int drm_rotation_simplify(unsigned int rotation,
>  				   unsigned int supported_rotations)
>=20

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Nd2Ooc566udnyVEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZh06AgAKCRD2uYlJVVFO
o0l/AQD4NUxDF1Iqicep1DXiZGPvZhf1jPwez0pMPAHHpKhKxAEAwpEufXVwnGPh
Pn+pnPga4IpjnDY7/8jcKtpeg+/lkwo=
=CuX8
-----END PGP SIGNATURE-----

--Nd2Ooc566udnyVEp--
