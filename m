Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E23D3CBFA7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 01:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F4B6E8C8;
	Fri, 16 Jul 2021 23:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F64D6E8C8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 23:20:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f17so13811586wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 16:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JN0ygNbAS6ft1cWc1v2QicoG9ILOiCYp3BLZQcswW0c=;
 b=rjni1+V7ItN1oOkGqHarTwvky1ffbBj/YBT/XyxE6P8+dCBUlNCKdNwP2gIWJTmVLI
 erIKrR5YOioyupiuYBHbXxINnehGS8lzrqg5TZqjm0MLLPpsyjHARe6JpfQoXMUodrSa
 TSn8eiu08mA/g4uPdtb5oRiLOq+FLZHBPn+OiVmpabLm/y1CjhQwK9fVo1Lhwng36Y9j
 IYmhU0yUKH8qoFla57DJ8S/2hzSbN4tqT7rXreSt4iJ26Cj3/FkqTq9/DEOV5T64ljjK
 O5ZKLicg97jbfg+d9GIHqkJ2OFfo92iFwJNn/TG5hr1tWqEzhCA1aJegoshHu1zPAY5M
 wxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JN0ygNbAS6ft1cWc1v2QicoG9ILOiCYp3BLZQcswW0c=;
 b=MqGBWoGIluMlkCOmSgyqeB7PFhI8nAqV4f/hkfaxjewj5lT8fHvYx0Bx2G9MumTZXY
 swu4MQjBi1jls+lCg7q8jwDLC+dhS2GzKtpw3TyNUksS4c9NOGEysmKiQwgvLglgByt5
 UKJq33CcSqgc1s+1JeYsMXljWDiXp0DOyii5ugVzM0M8g+h2m0ri43J6InE9WciXRBpr
 vr0F0+v3EXIoBfawu4ENKsB8W24yXuRQPVK3XZVU6NkheKtGkZQ3Wlzl7p0Dz0mv6wwh
 zlV+23h+9Wyrga/cCnrkytFwycp74xL0+hBMlFAjz7Uq7tntfYqSbSKf/iepmjOtLL4r
 7/ig==
X-Gm-Message-State: AOAM531TlaSXWhsjNPnjG32K2ic0IgSv/dYc2c0xcWYoqG7I4QobprBZ
 FyBi5VQ4wMVQg6oR2AX9u0w=
X-Google-Smtp-Source: ABdhPJxAmevxBxpz9h48/8/g0tRODUQpNI1Q+16qU0qjXy0HXiBm0zeA/xgyFjffTBhufGZLNG3D1A==
X-Received: by 2002:a5d:4048:: with SMTP id w8mr15447920wrp.82.1626477610057; 
 Fri, 16 Jul 2021 16:20:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c125sm14551734wme.36.2021.07.16.16.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 16:20:09 -0700 (PDT)
Date: Sat, 17 Jul 2021 01:22:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: Fix compilation of variadic macro
Message-ID: <YPIUo9kIA5mjg1we@orome.fritz.box>
References: <20210716124600.507871-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SrT0gId/g+EL9DZR"
Content-Disposition: inline
In-Reply-To: <20210716124600.507871-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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
Cc: David Airlie <airlied@linux.ie>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SrT0gId/g+EL9DZR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 16, 2021 at 01:46:00PM +0100, Jon Hunter wrote:
> Commit 43636451db8c ("drm/tegra: Implement job submission part of new
> UAPI") added the macro 'SUBMIT_ERR' that in turns makes use of the macro
> '__VA_OPT__'. The '__VA_OPT__' macro is not supported by older versions
> of GCC and so causes build failures when using older versions of GCC.
> Fix this by using the '##__VA_ARGS__' macro instead.
>=20
> Fixes: 43636451db8c ("drm/tegra: Implement job submission part of new UAP=
I")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--SrT0gId/g+EL9DZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDyFKMACgkQ3SOs138+
s6GgZg/+LaMd0IQID1rcVVk0H4OXbYtTYEQMk2toUsP9V8U8uvADEydbXt92GZQ0
AxW2hVsJqM99l1OyvrN7cY9whkCt0VUbJapNOM1w04j0WbwPTvN7nb42+92E67va
NIzsNd9/Gk4aUHrTOv3/S2BoZHbh/6HLtK3Z96Fns1XB2BSSh+7s7ud6mACPNIk9
PRm3MN/rNoL9eClPQWRWz1Z4tgHqiHCb7IcVzlaBGY1pWW6CBc+7I/Sw/N+Saw6z
SP9ISsnxIpqZ+eUVf89oOyYuEXd1soEI7NhhgqUCk4M9cSKs7q56QLNbtCwADe+o
Kn5tjKb7b7/6ZWi9PmcggRtY0nhM08DD7NtHMHfgacTXbYFhjcuCz2diQMYfR35r
PXaqkFkWO/czGUmqGzoShxG76mafHsR95dRvDh36/9DRryaW3NBAeahH9lP2i04N
V2LPaPjttnshF2qj9gSuGECMqNuEMH0OO+OAjh0ai+2xSVAOfC4lZkUlG71wxw/1
0s5wDc+jo3QalVEjIW8f1Vfq30VgSy46wvhx6aRzN/nnWeFfqdZpa7DB3K4pkqG0
5K6tT5Zjab4pEEDq+Dp5ob76y3eJTWhx1VHSNAl+1JAUAP5+A/dbEH3qcGHDE7/I
FBEkgxCvXvD1wYhHNY5GNjvDG84LIH92ri6HcVb+fitquKd4IKs=
=YdGY
-----END PGP SIGNATURE-----

--SrT0gId/g+EL9DZR--
