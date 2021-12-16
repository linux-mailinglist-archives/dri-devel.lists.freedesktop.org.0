Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C639847759A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8713510E882;
	Thu, 16 Dec 2021 15:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0604110E882
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:17:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j9so12698675wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d6dLbnkWK7wNE8BZGENwCf0S7oFVX0y+/nWXJ0NqB44=;
 b=OIj/txpPhui1n8Zu81sY/T4F6cuXcTDjXRyO2n5RabwA9LcJji2dGTyK5EuuLhyfcn
 4KKS8gyGDDsyNp4o3Bej4bqOKKeEwGZK61rfen/XabhIE2j2VhoYv+zGzn9xOn77a0Tk
 RExON7YRNsIeK/LuVD1jqDobD8HroRDYZsQY0dzXVwICINp8HFXfih3X7DvLKGr4a8Hg
 xg/Ps7RcQenDfXHyb02SkCv+xcvfm6uZ7EE4iK/qzKzX9shIYSwZcek0pwE0z2R0yTFT
 q3QOP8R13xQBTSSr+H/lvevRYEHT0x6oAt+sPxll4s6NMcosb3wmLF6i5HMCN8j2kulq
 e9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d6dLbnkWK7wNE8BZGENwCf0S7oFVX0y+/nWXJ0NqB44=;
 b=Fee43uBAYg7vn6ltpCRuTx24STyJaTCqHjWDVSlPHO0VCtwF2whsn6M3f+joKVS09l
 IlKMp8f4eKBD+cSQgbzygcnVRk1+Jj5lECpqDUtDaYReb9/M8hHVeDR6zQ2NHrwiJcJV
 JQEPuL2XwXWfT6CDcD4zfqICYx1mQ3zkdQpMdOI+5hSMQTTjchK3+jYZhwnXREMg63gb
 z1d08Jl42SgRMZ5ZJ200FwtP4eOfhhS1/oO23FgFxKzCK7a6f0Jc46MErtkKl8xOwr2Z
 N+NOacmj0ZRb0cAoYm0FoIiWIPTLRaxWWGLAamnskZ0Qts6Aaz57vKGCKT16N31hGKfH
 zzrA==
X-Gm-Message-State: AOAM533x841N2HZAgLI30tyfn7KTOpWg5AUlSA4J0jUVcFKrkmJTTJie
 GuWSQt6+GATyGQMre266Kfs=
X-Google-Smtp-Source: ABdhPJzd1jZbXWBpkRK3RaJ+dWeSpECIxOBJmwQ33RK5mfrBb45RfR3elrOFN3Tu9n7HBjiNf+iOfg==
X-Received: by 2002:adf:d1a6:: with SMTP id w6mr6055630wrc.274.1639667850594; 
 Thu, 16 Dec 2021 07:17:30 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id f13sm48343wri.51.2021.12.16.07.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:17:29 -0800 (PST)
Date: Thu, 16 Dec 2021 16:17:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 07/22] ASoC: tegra20: spdif: Support device-tree
Message-ID: <YbtYhhvse0sxhKxe@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uzk6upfeauAzdoAz"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-8-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uzk6upfeauAzdoAz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:10PM +0300, Dmitry Osipenko wrote:
> Tegra20 S/PDIF driver was added in a pre-DT era and was never used since
> that time. Revive driver by adding device-tree support.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--uzk6upfeauAzdoAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WIYACgkQ3SOs138+
s6GK9A//Y7Tw6WHpypYImYoTs7lxJ39hjjAQ1y3UpH/iunNkSxkFtezdQ9Fivimn
1ypvgQTPgGhT77FCiLUAizaw0Z/5tyBZEr4lALU/l+uhH1WAbf7NgqFvY+TyoGRL
a//yFoxqGafUCEmE3cduDo/2BsdxeJ4crpht/T/oyCJkFzDzFzvFBRZ8CjlcOO7H
eho0IEHSusZk5lZlj1xLAPBnEQRheEFid0xmYObmS16Dt2ZrgmXQc8xsI9NoJFnV
5VPF8uhvdncyM810Z7hQT7wDM4Tyj7RnQYhJ/zcoBFgB7ujP/i4FttWKBdhFjElN
ZqHUhQcTaQBiV2dgDYhZo+l3S0g8bZrvntQ5Aedjn+bprfZ9MpEMoJP9MdW3ynem
6zaEzul5jF6R2rPk/4XtkVjTFUzHKatocrIsOOJR10vFravNus2g7Pd2G5JuIXok
iZGGPWuX3UvVPtkWsfsUQ0SwKUkY8sB9RlCiDxB2jh61ikc1aPy5Z21Qpwd1pWSq
ma1fOp00317zZkLkCNMGgd3vEx7mbqt9E53hK42n0pSp73ggVfkKsNLskIRHYa1+
YHSIdA5GAtXjaQ+2kRFPo3H9OQkEMGTCEYoJsaHZR8+EcVTXvAJtVwNtbPyyqMuX
oaV6IXZcOEPoQVa68Lanf2Xm/kqnxGaAgqrhGZX5eTeZjJ76qv0=
=G20c
-----END PGP SIGNATURE-----

--uzk6upfeauAzdoAz--
