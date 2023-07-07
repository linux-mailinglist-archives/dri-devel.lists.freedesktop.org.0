Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308F74B0C3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC7E10E56F;
	Fri,  7 Jul 2023 12:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7010E56F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:28:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31441dfbf97so1962459f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688732902; x=1691324902;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJA6+/g6hyQtclq9OA+60uWzgmpTlAiLIyqyQBByGJo=;
 b=atGuYPEU5d8ttk2i/U9gnbpEE4VH7IYHznzcHE2YFGDaXUSXZPbWWiSKJo9smMCcm9
 QanNiFXqWkMHtvwoAfquB56dS1SLhkBJKXkysGit8pu6kdhw4mjeHwiAXcJVl2QYJFwV
 LuktSzppQnRXpfSO5jS8t3NyAoq6icvGiVhaDm0ctYXpo9hbjdLmh5HbKdF1dymTrvkA
 Vm0KsP1KGwPj0cSDGV/ByLnhp4L+Iim8Ikw8AB2cAXZYwDqNvqiaHGEycjlRMT+eqo1a
 D+R/iITQVozvANPIy+r/1c6juSWDHwhOAJRSdXD3z4dVtyftbiOrC6GdpT1JIwz6dZuS
 UEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688732902; x=1691324902;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJA6+/g6hyQtclq9OA+60uWzgmpTlAiLIyqyQBByGJo=;
 b=KbsLrZJsiMsuhqumKtE3BCjrDdRBbdobDT1mG6DGF9CtNzi7qX701MYbaL4IvqBDn6
 XeLvbdDeaY42MmBSvWbobQlwvbWH/nDA8NM+yIsU1TttxnsxcGpVBaIJ6SocqEDh8h59
 jFm0PpSST957DaW5n1DxkJBGDoMbgajILgfhTTH49TII0Z8ju/4KXZRJVqfzrJUKuiiZ
 JdsJkKWIfEIthIreLIjg6tft0e+JbMppFuEec4kia71EVzNCnf94nyNaw9rJ/oJeABGV
 J0JE5zr3g0ky8xZa8QVKOjy77Lgb0FmenqaQ3TVCHeskNs8R+mvDjiLB+D4TIdSTMBh4
 wxrQ==
X-Gm-Message-State: ABy/qLYKj1Xfxlrl4ZdUBcjzgLlpKvExFfJ6tBVuzW4aP1LqtZqIpKec
 1V1d2dTXxsjlPD+vdgPMDAE=
X-Google-Smtp-Source: APBJJlEAIrjPu2Q1b2mUmPFXZHE/mktSLFqXqOh8lDPkDerFqD9Tl2Il12cwVSatuF8JIu+Q+UpnBg==
X-Received: by 2002:a5d:460c:0:b0:314:41e9:9a92 with SMTP id
 t12-20020a5d460c000000b0031441e99a92mr4294457wrq.24.1688732901438; 
 Fri, 07 Jul 2023 05:28:21 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 i14-20020adffdce000000b003141f96ed36sm4418753wrs.0.2023.07.07.05.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:28:21 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:28:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH 12/18] drm/tegra: dpaux: Convert to
 devm_platform_ioremap_resource()
Message-ID: <ZKgE407-trIp_7HV@orome>
References: <20230707072034.48977-1-frank.li@vivo.com>
 <20230707072034.48977-12-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qEQdviPueCKP2hNt"
Content-Disposition: inline
In-Reply-To: <20230707072034.48977-12-frank.li@vivo.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qEQdviPueCKP2hNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 03:20:28PM +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 4d2677dcd831..f120897ce4b3 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -447,7 +447,6 @@ static const struct pinmux_ops tegra_dpaux_pinmux_ops=
 =3D {
>  static int tegra_dpaux_probe(struct platform_device *pdev)
>  {
>  	struct tegra_dpaux *dpaux;
> -	struct resource *regs;
>  	u32 value;
>  	int err;
> =20
> @@ -461,14 +460,13 @@ static int tegra_dpaux_probe(struct platform_device=
 *pdev)
>  	INIT_LIST_HEAD(&dpaux->list);
>  	dpaux->dev =3D &pdev->dev;
> =20
> -	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dpaux->regs =3D devm_ioremap_resource(&pdev->dev, regs);
> +	dpaux->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dpaux->regs))
>  		return PTR_ERR(dpaux->regs);
> =20
>  	dpaux->irq =3D platform_get_irq(pdev, 0);
>  	if (dpaux->irq < 0)
> -		return -ENXIO;
> +		return dpaux->irq;

This change has nothing to do with what the commit message says. It
looks correct, but it should be a separate patch.

Thierry

--qEQdviPueCKP2hNt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSoBOMACgkQ3SOs138+
s6E1Cg/7BwHVxlGOZc5s4JgJCBnTWhzOzzu19uGD50cxCUqf+eWXsgMq60G9QhLU
1AlrpwVh8W+1+Iig9hcMUPM365j5a4PmiLcxTp1FFKkQKQB0DdKk2mAWFgbD4RXt
WlmMXFbelc5qw1YNF3nNYZtuGE8lLzCGI0LV4hOs24KmXJBx0sRSuKkwVB7rGb86
pjVGv8XMLCtr0Ij8p8Zp1q3rne4F5WUOhS5BP/+p4HP4eNlXD31mwHsRhZkirNUC
ncsT+vGmle/FjBiyEFxOFnaii2O4bkvV8b9KbUVHjV3kDDPCqVMvUidKkXVY8Vjw
8S3Agm8dz6dLcWqeqpQhg9pCcMs+m+6wkAAYgIb2H9vZXmyg/UXH+oLceF/MyYnR
tKGzr4AutYFm3aar7bVwfy9taSkcFScfP3yJauZSEkLFc9/4rsY+FbBsZwYmarq6
+rME9qUjwapHEyppQXiAV9FOA2GVVAc5X19RCmG9Da/LA/lDPrinhkE2/ngZZsQH
nf5cN25ravD+qKcDgYtJlda72nSwo4H2zXbPE4q1poLr7B7Mye8Qvuups0Ninsem
IqlqueYQXfgprwTG3WyQbpXJ3cSV8CaGqW6svI4MtcQiRVKfLWMrFj+HJ/1MRI46
QlC0mhvtb015qqQuDdB9nqy04Xm88lmiPXxFSnA+CiQWbT1M+6M=
=k0Vf
-----END PGP SIGNATURE-----

--qEQdviPueCKP2hNt--
