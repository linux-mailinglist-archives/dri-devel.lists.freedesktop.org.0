Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA64460F7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 09:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8120B6E85A;
	Fri,  5 Nov 2021 08:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D156E85A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 08:59:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id y196so6459243wmc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 01:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QPslnKsFyR02C7DZhk2yfhXwOIAiWBPx0Yn6206b6Z4=;
 b=qWXLuSEgXB1oAPm85i5w0lXxLpDHnSP/NA3OtleaComjA/rMqbUQ1EzfwJSlVq1lqv
 6FPm/48+iKH5AhAnhtEznI2hfFh7PmdlevJCgaYJ3eHVs87lUKAdynpjFGADeYbpj33o
 inawwwK9CKL6VntGq9l2iVKSABi3sh9jBEfrsB5ym8h1FhLJV97CQsQzUj5itCv3eXOA
 uQo/XD+tjEe3k7Upi4GpX3f8Xyk1+F7d5LxOT+HemSY5Mh8d4PtLx9qwOEB9XYWQui1C
 oPlOS9bzg1oCPo1r5ctaE100Qt+pnU5Og7GoUOW6KpdIbDRJLnFg/cRw2tQgmIjpl7gU
 E00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QPslnKsFyR02C7DZhk2yfhXwOIAiWBPx0Yn6206b6Z4=;
 b=PGb4dAwxYfdbVYi9xrAXECXjalo9W8Bq7dpG+2uXVje1vW2A3tdpdfLyJYtBU6P7+f
 q3rev+25AsKw28HJegpggcJ9xMSW/ISSzUDs9KEbfWc9ffQsfnuom5Oc1cRcWtMx3oq5
 39AHx1+TBF5oKJ+MLMxFobmVMuwt6Hna7RBcg7TByE+SIa22MO9oSn0K9nnu0ewRyQ42
 gKWzmgzCBIA61Fa/IxnYnet17qvM7UH4hK6qFM1lt34aNRwRXgT/GRMqfQvuHCaBcMV2
 8UvZ5QpIJ187unFFUmKSgOU4J3elO8jCUVIpKWI9nc4gc1WESZtv7pwF6nOk7/0WZo86
 4Rtg==
X-Gm-Message-State: AOAM533K/ZCttBMWT/7r0Ta3J41OD0Z9fbQYwB4pB2/R2erW2HbtylJJ
 zlC1wWc1veej5yzJ9jYCdoU=
X-Google-Smtp-Source: ABdhPJwYAJdSpbPa+WXOwJHCU5Bk3EKdxQqhmIUpojZpB6gZCgnwErhhY+v3ZxrJIq3kH18STzkPmw==
X-Received: by 2002:a1c:4306:: with SMTP id q6mr28815923wma.29.1636102768298; 
 Fri, 05 Nov 2021 01:59:28 -0700 (PDT)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id f7sm459611wri.74.2021.11.05.01.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 01:59:27 -0700 (PDT)
Date: Fri, 5 Nov 2021 09:59:24 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] drm/tegra: Changes for v5.16-rc1
Message-ID: <YYTybH9cEcmJUaVc@orome.fritz.box>
References: <20211008202334.1679411-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pIOV3bZo7l6jpjwc"
Content-Disposition: inline
In-Reply-To: <20211008202334.1679411-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pIOV3bZo7l6jpjwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 08, 2021 at 10:23:34PM +0200, Thierry Reding wrote:
> Hi Dave, Daniel,
>=20
> The following changes since commit c3dbfb9c49eef7d07904e5fd5e158dd6688bba=
b3:
>=20
>   gpu: host1x: Plug potential memory leak (2021-09-16 18:06:52 +0200)
>=20
> are available in the Git repository at:
>=20
>   ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.16-r=
c1
>=20
> for you to fetch changes up to 5dccbc9de8f0071eb731b4de81d0638ea6c06a53:
>=20
>   drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+ (2021-10-08 21=
:17:38 +0200)
>=20
> This is based on the drm/tegra/for-5.15-rc3 tag that you pulled a couple
> of weeks ago. As mentioned last time already, the userspace for the new
> NVDEC driver can be found here:
>=20
>   https://github.com/cyndis/vaapi-tegra-driver
>=20
> I'm sending this a week earlier than usual because I'm out of office
> next week.

Hi guys,

I haven't seen this show up in drm-next yet. Did this fall through the
cracks or was there something that you wanted to see addressed?

Thanks,
Thierry

--pIOV3bZo7l6jpjwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGE8mwACgkQ3SOs138+
s6GxNQ//TR4n3eXSeF2KWCvPn48lnO6gz0mEHoagTDqEyfRyI3vkgTfp//OPhb3V
aZ8QEMZQ3XlO/DCpxz9jAwBiSoPJdn0fjjtv4vuWHg1XDv6pbWS5Kn6JJ86gl/cZ
k+1iU2WGh8zQucjLN2uNN+j6N4XmJLRidsMJfXwfnZCadAKF58CSMQwurC5bM73y
6Rk7i720Sbd1dBWMcUCIR4flNMOlpD7xXLuAQcaonfaJVoqdOSDoz/z/3Q0r9x5C
mswYCQnoOEhz7P6IC7SvzaCQk2c+vPd1lulv3Jzsq0OyHbAJhOrGxLtwDGECD5w4
HomBetLJh74ZS7N3WsvzWeK3tQG6xdW6NNYCkvAKHPnbp3f0wAyPQerrl/JneT/e
7QLbpY09gBLYUYf83j8vIlspY32R+4XeViEbAMZRjfsrLm/EI77pP5GIjv116Ivl
MlLwCQURXpZJlI7Q3QiHxagluPFW2K53OhzQPdcv2yhvO9aOFLcmZVEfxyv3T1Wh
xHivtOp58rCM/3ZJr1YU00x0GNxIpG88hw6ILwYCYCbKiO+9VRJxpljw3X9V5ReG
LFUzTbSrr6TRupCZYr1O4dqkT2BM+QMLzgLZOS0E+0vHOTxK4cXn4KZJHhcMazCc
3LGjr9umuLLZTRr1i06HcnrAkXSYeqDLwkAt6jPDLOvgYrmUWHg=
=YbHt
-----END PGP SIGNATURE-----

--pIOV3bZo7l6jpjwc--
