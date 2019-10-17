Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3BDAE64
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B0B6EA85;
	Thu, 17 Oct 2019 13:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAF46EA85
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:30:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p14so2378420wro.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+NQyWsZE5qw77U9tzVF2ClbbS90y6tOgsJNEVsMbSDI=;
 b=pDvFvb9IN+Hs9OnySP5N4wZP3hlwo2lYwOBMl9FmtlU1dKBvM70sdzYFvpPum1Cdhu
 q3Nqvc/0AwVbE34b6XodEXmfELicrwSoAjZquyv7yNlIu1Vl1txHTth3QiDFqrhGIcDt
 XzuJ8N5liU4zonzPGJ10cUScJShMgqDyxZxebCu9pzQ6jtsRQ/jlCQZI+eVRiin5pfZy
 E9kDqujSudQ65EgSjxU8udzGNru8rul26T4PrkKORh45VxOzDuUyFFzn0KfVsg5Rdy78
 wd/L59FgHq4N0F2rvFEtOzfJ9k9Cw/+6tTdmt62L9tihE8ew3nsqm3kmSTRmt2Ye3Vho
 Tv/g==
X-Gm-Message-State: APjAAAXsVgwRgiJ/ccdQgpJFgiN9gvCr4jJ3PCCd8j/q/161BV1d0Xzc
 JxLSReadp5+khmByB/mzcAk=
X-Google-Smtp-Source: APXvYqyeoKVFgxDNysBkxt7YXiUZsMoQ1rzd/E+ZHK2CR0MpmY4qd7+6vD5yC6yl+L7oQ2yjxYL/lA==
X-Received: by 2002:adf:e646:: with SMTP id b6mr2901364wrn.373.1571319011349; 
 Thu, 17 Oct 2019 06:30:11 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id e15sm2373481wrs.49.2019.10.17.06.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:30:09 -0700 (PDT)
Date: Thu, 17 Oct 2019 15:30:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] gpu: host1x: make 'host1x_cdma_wait_pushbuffer_space'
 static
Message-ID: <20191017133007.GA3931256@ulmo>
References: <20191017110427.31354-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20191017110427.31354-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+NQyWsZE5qw77U9tzVF2ClbbS90y6tOgsJNEVsMbSDI=;
 b=GLIvP7UzcDGiQtYKqCruD+2iLIqCJ3F+pKsE868YUyosDIUjYNEiKbRoWFIyEm0OH5
 1BSwZCB9Y+Mr1OAJJp1BLoSlUZxz7Jp1ygy1hIoI/KEmqIuExo0d/1SVQ+h+KMHThKnq
 NUREc5O49sZG0NdQ/Ic6iz/AueOS08ZCZ0W3WTsq+t2HqeWG9H7J3SMVzJOSxQNkzC7P
 hzqxIAa4L2USX2iRBI0lfjt4YbkZbVN8k95VYpwmhYLmS67wlkupT5DJro8qXA4OlmA7
 zo+P6U2vccIanKwKv0yGqWub3wdGf/odXpHEKEd4LFkwV+weD3h7VEi+IyFgwaQJKfe7
 Oj7Q==
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
Cc: linux-kernel@lists.codethink.co.uk, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2093777177=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2093777177==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 12:04:27PM +0100, Ben Dooks (Codethink) wrote:
> The host1x_cdma_wait_pushbuffer_space function is not declared
> or directly called from outside the file it is in, so make it
> static.
>=20
> Fixes the following sparse warnign:
> drivers/gpu/host1x/cdma.c:235:5: warning: symbol 'host1x_cdma_wait_pushbu=
ffer_space' was not declared. Should it be static?
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/host1x/cdma.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2obNwACgkQ3SOs138+
s6F+aA//aS7lK9wsgW8RKg0cYIVMsuuPaHV9YA0mw9ZBcrS7AUWBIklMro1yeZOr
OWlz26ZnZDqhJ6DVZDiUT386GUukomd6804rnwrc+sf9xy7EdR/Jnhf8GLZN6MeH
oVakuZw0ZAIVCD+ZKAvvlPVYeRooi+n1Uk9f58uA1UgziiWYJIYuTaV6I7hb5jRY
QjPnkJNGk2+yR54vkCDy0YXQc5WwcrxC2GiuPT2P1dfPC5UjqgtiqXOlVGLm53bf
u+ZXGqYlTAToSiDZ/B784asN0AhUW6UTwxT7aJaFMQRYyyE/tR3kUGsRtD8w6Ucb
3GD3b/45eCaFtGmnYOMjbFZE75vOR9BqHoxX2DG6jqNNOhCiqPYtrrJvaxm10vIg
xYd3Chf6zmNqDiLEvmUKycKfdaojENpOwLGWOr1jjhCKeUaKkhJW1geEiCu/7RAg
cwCESTakB+Y3SDweFsnNsxRShEzadmgYqdSQCGiu8AU9yrFGDradvkjrEZmxTkkH
G0tr4SoSnJw2YVeHD213DepUTgcD+q6aEymsTNaQz78NbJ66K3gKqhboqn+9LJ5g
1Ppd4+g6MaIYx28b91cJvOf7mGY3r+b/+VORCrlSUZzhfpiYnIecwPeMh6VsCTSC
RA9HHkKVXtaGZMNJx+5v4Cs/F4do1tCGddf7FoWw6dMgAgImYvQ=
=vNtF
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============2093777177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2093777177==--
