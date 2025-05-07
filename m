Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D08AAE5B2
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7CF10E84D;
	Wed,  7 May 2025 15:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f5xKKBP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CBE10E84D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:59:55 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso270245e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746633594; x=1747238394; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GNlloVBSBdqHS/4e7VZJEvQDPC8zlmapQT1HEDKsd/U=;
 b=f5xKKBP4/m173nFDT0zTkGZ3O4N9Q/lkRc5uYLs06yktWFrQeVEiD4VIieeYN1tFux
 ky9E/cMZFqkWSd+QQrkZgXzc3eoknIpZ75nv6ELo0LtGEYktJT8QRPaFRO7O5sZDnSy5
 iGOATR5cZZodTZIJwQL9wG/psjl/e5S8ALAzLdbKzbKdBqrFI5WJbnSaTgsDZUa5pTcY
 38rC+gznoyeg2HFy5WQJMlH3nqItYJyGY7db6wd11TzQzyaRfYzf86cFBIhjYJHSWInM
 73l+64azN8QJQpyodIfzE7jYhCVy5TnV2/w2SAkwSyJP8JH7Y1jH3jFD8oPR5iTEER/h
 XPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746633594; x=1747238394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNlloVBSBdqHS/4e7VZJEvQDPC8zlmapQT1HEDKsd/U=;
 b=YXusXM2bNWqyid5uQBGLcpj/dmIniLYDT/v/8s8dR5S+pvoDvJRBo1mYcARJEZXfyl
 me5NMDyEH4ZId1KoCLc5Rtu8V5uj9HZEMTarxQXDEBa8GGh9a8a0SqiidBX+v3JPANMy
 nKsN1qhE6GErQoqyTSkIBMForE8YZaDO2GGdDBVmsWb2ANN9+e9eWRv6ZLKuYCaJBf92
 eLpyeRJqC2YPy6B3ew+uqy+OLyxgwGl6SV1jKUpRkRfJ2lnhoedpgMxcwozH3M6yohHG
 582uAFWE/BUx/ceK4gKmESc8+NWge95lCN3TlPJveMo1mkaX200hQniR5d+nRgIFsBgF
 DIvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdy0ebfDmcNt80Hez3xgeQxew8Y+xnPmpY9KKxcaxHJ1YbAqk2OOiFcueiWraMy7HP4S73yVHmG+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4CSQHlvWgVrThGg2JxU843Bcg0rfkDQGWhoTabLr33RH4kn5C
 o9EMPmI1fOdW+kr7RFZMAYhR0USl/kKPxr4uWJvCzide0f+wEeFu/gCXbw==
X-Gm-Gg: ASbGncsfYZ9+wuDycPaXQQq6aDX74WKLFwvREK6kdzmAUoxrXep/UA5mvDbkTlVjuyM
 yguerhJlcQj8+mmtGVYxsryfOqYr0mHIMfXSgK+NkJGrZ0UiSWyCceo4D6H1n9wCMZX+Dmcgn1x
 NxkyCLUfZuAFXKczvmwvHt/1TyAQqNTsVPA+IsnwqXDPPMLQV4l7uyOR3nEODM20uesrNbi1f3Q
 a9dqtYD01auhE+nF1VRS0U4k6FpUrsc4ldwxkMtXapHemRAL1nKOdNK68KOY33du3vMEZnePlDT
 h1qY1OCDYztYv4JwixFNxAra1ELZRHmZDmeWpOGhTSZ1ms5uqL5ya1I3x5rNpTgpWgDxcvfUEfK
 WAXyiL7TnesSZC1xhOLY8mp2o3gE=
X-Google-Smtp-Source: AGHT+IGNbYw1CXoeJchTCMQofd/K3j2UuhbSMT//yzQ6IX4KKfobA3915QTDOmMMTF4GAA0z6nGCZQ==
X-Received: by 2002:a05:600c:3d0b:b0:43d:762:e0c4 with SMTP id
 5b1f17b1804b1-441d44e554dmr38391495e9.27.1746633593865; 
 Wed, 07 May 2025 08:59:53 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd33103dsm5282705e9.10.2025.05.07.08.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:59:52 -0700 (PDT)
Date: Wed, 7 May 2025 17:59:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Zhang <markz@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
 Terje Bergstrom <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Message-ID: <a3gzox3ajhvatfmld5ny2lulmp325ycnukksusfbtldg37nqp3@jb4qajtuzczb>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b7mf2ylrupklls2f"
Content-Disposition: inline
In-Reply-To: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
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


--b7mf2ylrupklls2f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 11:21:35AM +0000, Biju Das wrote:
> The of_get_child_by_name() increments the refcount in tegra_dc_rgb_probe,
> but the driver does not decrement the refcount during unbind. Fix the
> unbound reference count using devm_add_action_or_reset() helper.
>=20
> Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index 1e8ec50b759e..2065157daab3 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -200,6 +200,11 @@ static const struct drm_encoder_helper_funcs tegra_r=
gb_encoder_helper_funcs =3D {
>  	.atomic_check =3D tegra_rgb_encoder_atomic_check,
>  };
> =20
> +static void tegra_dc_of_node_put(void *data)
> +{
> +	of_node_put(data);
> +}
> +
>  int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  {
>  	struct device_node *np;
> @@ -207,7 +212,14 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  	int err;
> =20
>  	np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> -	if (!np || !of_device_is_available(np))
> +	if (!np)
> +		return -ENODEV;
> +
> +	err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, dc->dev=
);

Actually, I think this needs to be:

  err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, np);

otherwise tegra_dc_of_node_put() would attempt to call of_node_put() on
dc->dev, which won't work, or rather cause corruption of some sort.

Shout if you disagree.

Thierry

--b7mf2ylrupklls2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbg3YACgkQ3SOs138+
s6EljhAAoHtzDpVDWTR79gSRirTUrVeV9+PHHeBUtEsD2h/VKtAZWrLLTk7Z7tY7
zMC5NFztTtHDfHiqlUuT9dG5YX0hdoKwb04Bl65ZLaLe4t8FoxBHDpObZb4tGTsx
ZpnmBpNY9ikXaNqRhskuquzRwcm95DINhrVuqUMgk/eSHQqOh3E5uLhKtP2Nj0be
Xv58dNTlnVCJRsM8A+Pwlsfj8xnkD36hhfWxQdVjLKfcC8MIAGqx9JBbyC+n0V2L
64bRO3zrervznyWK6JzkVb8KUEi3YR1tLlwP4FLEGo9J2m+N3KAu0qUlgj12I5iM
BPiabcYV1rO+YIIKxdFtXhBP4hbq/jqyClA55+f7jgwnlnGURS+AnaKD8nfl5Ite
vyv25UP4kxC7dN0O2uyxKeJJkM17qwH4cKHtHahU2LrgRJBz5wLE/uxiYWGy8C0+
Vchpax/NljQpBaQek/oqU1cF6K+Bf0cy6+lifsUWQ9x0B151n2ut2Xnb2qJb6cru
J112ofa5UblA1BNaCrkrYkYhkj9PAiHPhT8lbHGxxs+xHh9UxW5XGGkp4lDganlx
O98SkqHIdzNXZuVWKaqWj7dcpZdE70DCp/HLdf32wzXbwDrxr2O6RREmTfUP7Y+e
YsSeoMBmJvaV/9nH+U9fHiuNRGpBmzldnQTM3NuNT3mbspibaww=
=cuA6
-----END PGP SIGNATURE-----

--b7mf2ylrupklls2f--
