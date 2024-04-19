Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A88AADB9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368DB10F90C;
	Fri, 19 Apr 2024 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XqwmOH+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618C10F90C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:30:44 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a519e1b0e2dso205921466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713526242; x=1714131042; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F/Af4iWVQkyplM950J09LUOzYoGi6+0INPm0Eq8Mzsk=;
 b=XqwmOH+BfMdoV/LmcQlEIiY+gSLmOxPXxuqeHIpeuJ8iqoH14lrhCkBs03axJUZilK
 fPUhA/s/zM4K7rH8XmsDEm3QCn/8oM99HTcwJRtZ1K1joN/8NlFdvJ0S1QhQ9D0/dVS/
 Gmemhm06DcVXWIbxiP21gus/iXJUPDQF+6OMuluiG59Bvz3sLNIEKoDS2foBjl7rWbbW
 hHnwFxA2+uK8/xPHln+DENlulFLzUMVtHZL6ABEfGMMeRD1WB94jmRJi3MPsp+S4n89K
 uxhyrSQ7h5ujbY3MvINrSZKUARQi/KoftoI29e4ZMfSiAnV28MRQEL2KE+G664mYCH/b
 cZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713526242; x=1714131042;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F/Af4iWVQkyplM950J09LUOzYoGi6+0INPm0Eq8Mzsk=;
 b=rtxyoFlDY3nVeIwsWIWAUr8VHY8AOA3GkUT3IfedklFmGj9fOw6Dnj3QKrRHWG+eCh
 OKhsQRJ3/snWRkB4JPMoJiTwANYIyIxylhYORmBGoQpL+mjP1Xqquy+Ht7nKtwr2UySS
 FUAxqWxfR/dNAAhd189x5MszcTqAJrAFXSzMN1Vd0Lw89OKSJkUF66IX5Wt9sYAw4jVe
 fhkXhcV52fsaAq/OnwnJvolbfYnCN7TbLqJiFt28YbKYcZ5kNqx7DMxGOdVltmTQdEMO
 EljczPFuFMq9zT6TiB03plkXfYtjEvqZ3GhyG1TYpg3DEGNyM2a2FpW2Xg505LBx5thJ
 gBLA==
X-Gm-Message-State: AOJu0Yw7PWOxUMa47zSLQywhAtrWAsF5FqKET3eZZxQ4vlvNF6EeBOj4
 IV7kQ7rfniEVI6CmpKL6mT6ostZg15x62AnQbKL5poXAHwoUyMzK
X-Google-Smtp-Source: AGHT+IGxIy+XoPWxY4/ipzxGIzuoyUFKimANifXZ+IrQzWpLKbsps2b8VE4siVRoEo3QO8uLztxs9Q==
X-Received: by 2002:a17:906:52ce:b0:a52:5613:67f8 with SMTP id
 w14-20020a17090652ce00b00a52561367f8mr1206770ejn.10.1713526242317; 
 Fri, 19 Apr 2024 04:30:42 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 qq22-20020a17090720d600b00a554f6fbb25sm2073529ejb.138.2024.04.19.04.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 04:30:41 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 13:30:41 +0200
Message-Id: <D0O2CVZTE5EX.3QZ30B9A58W32@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <kernel@pengutronix.de>
Subject: Re: [PATCH] gpu: host1x: mipi: Benefit from devm_clk_get_prepared()
From: "Thierry Reding" <thierry.reding@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Mikko Perttunen" <mperttunen@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240409165043.105137-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240409165043.105137-2-u.kleine-koenig@pengutronix.de>
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

--34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Apr 9, 2024 at 6:50 PM CEST, Uwe Kleine-K=C3=B6nig wrote:
> When using devm_clk_get_prepared() instead of devm_clk_get() the clock
> is already returned prepared. So probe doesn't need to call
> clk_prepare() and at remove time the call to clk_unprepare() can be
> dropped. The latter makes the remove callback empty, so it can be
> dropped, too.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> the motivation for this patch is that the driver uses struct
> platform_driver::remove() which I plan to change the prototype of. Instea=
d
> of converting the driver to the temporal .remove_new() and then back to
> the new .remove(), drop the remove callback completely.
>
> Best regards
> Uwe
>
>  drivers/gpu/host1x/mipi.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)

Feel free to take this in through whatever tree is most appropriate for
this ongoing work:

Acked-by: Thierry Reding <treding@nvidia.com>

--34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYiVeEACgkQ3SOs138+
s6G++Q/9H5Xt14Nf00X6R+jSrEl3odBJibivkMsacrj2MFV078JaOoHZZE/72UKT
/ZmGGK8O/HkLkQ/RAn3YueH29ZXhYe2c5YwCOGpQVv6F9P77ivdtG+6D7LfI5Lqm
mJ0jel/t4zacqv2TuBmt5zzQPoRUakgGsbdIgItKjtLrDRw3aQBj7Ra+h5/ere5q
i5JfCrWuxfI+qh1aFXIUMho9FM4QRcxcWiIwbWQehgxLHzbwDVhoheM6cIUpiAQ8
eZd99+fTZFGgey9iuMHemmPMkXXDcbBx8dG/wmUWLDoqsIzfb7Ua7qJwkLWJ5TXz
pb4nZ4GWA0JTIIcvHCzxnOreVh8OG/HTes0EB803nyDO8sud+GfY8g1mGFUwYW67
tHzHjrch1dFpp31JdWoGD1PTFEdmSYVdvs2+Gh33Lt1Git2xnpezk5vLjOeKFUG2
FzZoXfEsDK1qOCqPavtmhGUSwy/1k5T4nGO3FxbISMzhvweUIwMrAU4i7+yFGGhr
z1jT3pFAZVQVGOL9DPzmWLn66kf/V+1rXhsa/+i3VBV6x9q8FUff48pI3+OgVaqS
EqNe8whO3QA+DJ6n9uUr5NdHyyjmfsN/SyotAwDS1d2Leetda/+U+KCuIjz/T6lE
i307WM/k0jeDh/V4jkalyuNkFZ1xJKFElsDaQtcL7wENaWTtafo=
=bepR
-----END PGP SIGNATURE-----

--34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4--
