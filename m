Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB679101972
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 07:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E516E87F;
	Tue, 19 Nov 2019 06:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1946C6E87F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 06:34:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q15so9554990wrw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 22:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=STYck0ldpmlPgUWK/QtmnwfKy44OyOjUVjCG3r/tKEs=;
 b=MFnjG+O4uyCo40slCLnmiuIvKDiNe/jI0BEbXkoJT7CppbPVqcOW23LgO8jeEbKtGy
 VRzb9W/Cr1vzycETeQPo1vJGJ4FSPwo0P3keirAgI6MxB6IhVT822jyU/SKYbaaP4jFj
 v4ccjsFqDCYRBARl8WAJ1WNoWBudz/V3G1YV5ZAWV5NuSBT4pH99PMO1eXsYagX6iVIX
 wlOfes9a8jLBXdz/ceMmpd9lP/U6aM1uINi87JQIlQilBPVE4ryH9pgWYq/73AYMF1TX
 WAwuBeZZwtqdTDCXruDbyf7lXP2MTg85FAhXcSWmBQMBXan4uQ5q/78HcrY8DGm2cVyc
 tx7Q==
X-Gm-Message-State: APjAAAW6U9CrQPOl4ZZ8vy4aDj0G41A8o/oPzoUiTLo3FQ6p20REf/IO
 6C4lsGOEZs3ba5EzoZ3Cj2U=
X-Google-Smtp-Source: APXvYqzhNxj3/SJm0AqF0zMY4b2l3tY6B3JVFHzcm50DLbqWtLqLll98yGl8UaG/HY2uDbZ8yq8Icw==
X-Received: by 2002:adf:f203:: with SMTP id p3mr36441140wro.2.1574145269573;
 Mon, 18 Nov 2019 22:34:29 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id q15sm25965385wrs.91.2019.11.18.22.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 22:34:28 -0800 (PST)
Date: Tue, 19 Nov 2019 07:34:27 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 14/29] memory: tegra: Add interconnect nodes for
 Terga20 display controllers
Message-ID: <20191119063427.GG2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-15-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191118200247.3567-15-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=STYck0ldpmlPgUWK/QtmnwfKy44OyOjUVjCG3r/tKEs=;
 b=btWLNutlP2kDY/yLaixh/BuLXocKTIXi9Ge/nc2DSdpsZX3wYLJ8Va1hZj8xQh+5ve
 iQ7046zUAQFVSyyc9bYlRZNYXpVAhyfjVCVsoORr8Ght4Oh73ERcgnlCHKs0Is77j/Ai
 7TLjUMW+5IDBBSYBaQoWf55T5ETIK8T5jtd3t92ndP6tm3FvbYhzQFmAHC6d12UHiRt7
 sgy5G2u1jw8Q0iCDYYTPJAsEitOV9NWFcj7tZuzq827+rUhMNDYLN1vlJHgba2WpSZ+n
 m3neIJRvPGUsuRaKNs6bR8d9Uuaq1s6KxKMcb7xqh1zHh/22AixIq62t39PCTiwclEi1
 5Hig==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: multipart/mixed; boundary="===============0383931132=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0383931132==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline


--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:32PM +0300, Dmitry Osipenko wrote:
> Add initial interconnect nodes that allow display controller driver
> to perform memory bandwidth requests using interconnect API.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra2=
0.c
> index a8098bff91d9..dfcd9fdb7ce7 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
> +#include <dt-bindings/interconnect/tegra-icc.h>
>  #include <dt-bindings/memory/tegra20-mc.h>
> =20
>  #include "mc.h"
> @@ -280,6 +281,17 @@ static const struct tegra_mc_reset_ops tegra20_mc_re=
set_ops =3D {
>  	.reset_status =3D tegra20_mc_reset_status,
>  };
> =20
> +#define TEGRA20_MC_ICC(_name)				\
> +	{						\
> +		.name =3D #_name,				\
> +		.id =3D TEGRA_ICC_MC_##_name,		\
> +	}
> +
> +static const struct tegra_mc_icc_node tegra20_mc_icc_nodes[] =3D {
> +	TEGRA20_MC_ICC(DC),
> +	TEGRA20_MC_ICC(DCB),
> +};
> +
>  const struct tegra_mc_soc tegra20_mc_soc =3D {
>  	.clients =3D tegra20_mc_clients,
>  	.num_clients =3D ARRAY_SIZE(tegra20_mc_clients),
> @@ -290,4 +302,6 @@ const struct tegra_mc_soc tegra20_mc_soc =3D {
>  	.reset_ops =3D &tegra20_mc_reset_ops,
>  	.resets =3D tegra20_mc_resets,
>  	.num_resets =3D ARRAY_SIZE(tegra20_mc_resets),
> +	.icc_nodes =3D tegra20_mc_icc_nodes,
> +	.num_icc_nodes =3D ARRAY_SIZE(tegra20_mc_icc_nodes),
>  };

As I mentioned, we already have most (if not all) of the information
that we need for this in the various struct tegra_mc_client tables.
Those tables also contain some definitions for latency allowance
registers that we are eventually going to need to do more tweaking as
you suggested in your cover letter.

Thierry

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3TjPIACgkQ3SOs138+
s6EdSBAAkJq6NUF8h85zOp4aN7BmEM9zr6aQU87PcpheYtxkxBSWJB3FL3ZbULKr
uWUELJntyp3KXLEuosHFkUZTpvhzDhhyVi5pZ9r45M45uGgZqO1pMPunN9Ha1Uku
8RzxboJvFEGLAok5/9XW9tsotQ/wjhRQKIQWgzGfxLz2jFEWF0nPc5akod1RHQTz
dcmDT9D9gDXJqiAHJINlHxfA6O+pkTI3s7K2qr0O9C4ao+xgSOqcjWqr0yCOggw2
GSerhri3lwwbEAQk8FMi10nIU0gD8DDOD3iVGNqnR6djOzkZMMEfG2i5RzWzHk7G
ijkE6CnihiZwbDIUKdE9XBQGOp+fdEGnaznERMG1GWyi68u+nSmkGDnCtivJkL8j
yur3Wdk2RoLyVii0RScej4aAndbyVNhRslgPEhu0hs1e6YNI44L1i6LcAZFck87N
q/KQl6aiOpVajQ+7eiHgHOeYQYGXcz/GGRWToOmo9RHAu1gMqVdG03wgpAKDYkkQ
ls3DMn/qSgfH6YeuKWPes9x4gQgXtAtx22hlXxXC3P5cSw4XWXpiQFv9YLN3I/zs
SLrm0uaV8jsjyI0fF8dWO2RWQMlkyKj/kGQIL44ZRiYgO4iop1Rc3dIUPpn/NtYe
bOPFW64ShM7Ex2qHSHhiHnv60kq1YqYAUo1mxFa7XE12ygIkn3s=
=85iP
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--

--===============0383931132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0383931132==--
