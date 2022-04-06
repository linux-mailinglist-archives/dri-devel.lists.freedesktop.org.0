Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FE04F5EFA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAF310E167;
	Wed,  6 Apr 2022 13:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBA610E257
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 13:21:12 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id yy13so4273693ejb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yESXEe0+6GUCQQAygJIy9zdNmWQoteoBqsLlYT+U3Pw=;
 b=m4zu2aWGPii7y+HdtTFFDusKRn2vRLX86QvtKNwqf/ThhEGKyRuzHj2bLxziNYlJz7
 LXOouEGWEHMBixmGR2izzkw8ifx/0WpBgQXwWgg+QYGZX/xpdNM3akrfO1KvVzkBn79g
 hn3j8aIvqON4ybc6BCvU3FV6ziqo2ZvqjyYcgOhqBwk7vnVscLY6CdFEWd6ZpkwxpJU6
 wxw55Ez89y7FsCfmDBxJjKXAortyZPOdA7I1/tkZ+ReKnQyNj0Fcw4o35m3jlPECi765
 QLkDphzZiHVeXUtEmMT/INAICP80pYKLUEdEq6cyvUOK8SQRHRQkfq4pYQl/bsxCG4YV
 z61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yESXEe0+6GUCQQAygJIy9zdNmWQoteoBqsLlYT+U3Pw=;
 b=HaPE3mHoxVHzzhimaXzjGTW3T2KzPdetmqW17YAkHIHrnf6ajHksnSBIuVf27gQZn6
 TY/6X4loJHf6twKxsDF1h9PiMTSU/toNGNn6EF9axAemeLbZFpKPrh8OeVHO5585xrzw
 RrbA/X6YMNiOaIXmY3kv+qH0MAS+4oxh1gOfoXVpqqALE2eOCoM4QAHHGNFKGKqjDul9
 Yg5N2y5omVqfNfqCBzHOPt16tmomibJQw11hHUBLBY+MBSfVgYXAn4uCqYOM4aZgXvMn
 RVTGZKIguWoCav5++9h4yhY3ALvoaa8XKQIMzZ/TRof6uY2f2VJwhbKwUGAZyvW4/WiU
 /TDw==
X-Gm-Message-State: AOAM532Zpt0crEN/fxAzg7/QQ+t8NF9BvJgamJL2yxHNBsEyDRhherks
 iBL+iZ7W2ErAXPd8Qc7HpBk=
X-Google-Smtp-Source: ABdhPJyEt5Heruqfz5ekAxEIum+qU1DdZN/P4WNLsqph1vg/dCXgqNAQ/v26Wow97WmVAOa/yKEaHg==
X-Received: by 2002:a17:906:4793:b0:6e8:289d:c13e with SMTP id
 cw19-20020a170906479300b006e8289dc13emr1351726ejc.489.1649251270789; 
 Wed, 06 Apr 2022 06:21:10 -0700 (PDT)
Received: from orome (pd9e518f7.dip0.t-ipconnect.de. [217.229.24.247])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa7c0c8000000b0041934547989sm8012684edp.55.2022.04.06.06.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 06:21:09 -0700 (PDT)
Date: Wed, 6 Apr 2022 15:21:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/tegra: vic: fix unused-function warnings
Message-ID: <Yk2TwyteFgeqkZE1@orome>
References: <20220316183708.1505846-1-arnd@kernel.org>
 <20220316183708.1505846-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HP/3wNqKzbcc9NYj"
Content-Disposition: inline
In-Reply-To: <20220316183708.1505846-2-arnd@kernel.org>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HP/3wNqKzbcc9NYj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 07:36:47PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The use of the old-style SET_RUNTIME_PM_OPS() and
> SET_SYSTEM_SLEEP_PM_OPS() macros requires function definitions
> to be hidden to avoid
>=20
> drivers/gpu/drm/tegra/vic.c:326:12: error: 'vic_runtime_suspend' defined =
but not used [-Werror=3Dunused-function]
>   326 | static int vic_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/tegra/vic.c:292:12: error: 'vic_runtime_resume' defined b=
ut not used [-Werror=3Dunused-function]
>   292 | static int vic_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~
>=20
> Use the new-style SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS() instead.
>=20
> Fixes: 1e15f5b911d6 ("drm/tegra: vic: Stop channel on suspend")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/tegra/vic.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> I see this warning on 5.17-rc8, but did not test it on linux-next,
> which may already have a fix.
>=20
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 1e342fa3d27b..f56f5921a8c2 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -513,9 +513,8 @@ static int vic_remove(struct platform_device *pdev)
>  }
> =20
>  static const struct dev_pm_ops vic_pm_ops =3D {
> -	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> +	RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_vic_driver =3D {

Hi Arnd,

is this a replacement for __maybe_unused annotations that we would
typically use to address these? Is the ternary operator in PTR_IF enough
to eliminate the warning? Does that work the same way for structure
definitions as it does for conditionals where we use IS_ENABLED() to use
the compiler's DCE for improved coverage?

It looks like it, but just making sure because there's another patch
that fixes this warning by adding __maybe_unused.

Thierry

--HP/3wNqKzbcc9NYj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJNk8MACgkQ3SOs138+
s6EfghAAwTnmOPtrfC5Qjzo6Gd2YHQVRPrJ3nq4VQNddX2aPY7mHpsaQgU8pmrSH
bt8kUlPsGkh8lEJ2B4b1/MlIxUrhoYj+XOjzHBl3McdHJMKTzhnyV45HU/nWUXtB
rptRs0Bz5eekensRZTtklgjxmS/cdxeje8reyKe4aE809Mx8AhseYV9aHuB/jFkM
QiqEcacQIJR+W5y+3AUrGjr6wBqaSt/69d5h9u0C25CD5mHygMMKu38+AMGFlvsL
mhJktcKigjKSoUj3L5RKQKX6ZWqsEIHDjJbboiFcuFkGliwmaR6GZGIp1APCOnzW
TOvxkgatv2gQsp4T1ymDr323n07eNYXzBq14uXu6tBkfaqaIQ23AwSHGjJIcKrER
qAe67DgH8OKHUksMuLzHelPM52WeBsO/FkzPIkdD5srB6jZBaexwIsj15nT3Y9rc
4vDM9/M3g7rISfa2WBfRrdSfx5Uf4bMpRedrpBowbC2I+DUgyQ1SlZIgktzr3r4k
pj+2xeBTKfb0UjsgRYv6XA/nQ0zOiwgMio65gcOBwJIm4qxlcpbBW+KbtNiZz1qE
0yYYfIx0IEiPyn5GJqVeS0vhvq0nfqAsbadY/hiB08xoPPqPPqjPSWKdgUxvxEzl
Nyf6UNmidSSQzfiyR9xjdBMasYFYlFNuMiDKmNCGQqP/uslwIrA=
=itVd
-----END PGP SIGNATURE-----

--HP/3wNqKzbcc9NYj--
